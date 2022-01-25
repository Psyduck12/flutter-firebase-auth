import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

abstract class IUserFirestore {
  Stream<Map<String, dynamic>?> userStream({required String uid});

  Future<void> createUserProfile({
    required String uid,
    required String email,
    required String username,
    required File? image,
  });
  Future<void> updateUserProfile({
    required String uid,
    required String username,
    required File? image,
  });
}

class UserFirestore implements IUserFirestore {
  final FirebaseFirestore _firestore;
  final FirebaseStorage _storage;
  late final CollectionReference _users = _firestore.collection("users");

  UserFirestore({
    required FirebaseFirestore firestore,
    required FirebaseStorage storage,
  })  : _storage = storage,
        _firestore = firestore;

  @override
  Stream<Map<String, dynamic>?> userStream({required String uid}) {
    return _users.doc(uid).snapshots().map(
      (snapshot) {
        final Map<String, dynamic>? data = snapshot.data() as Map<String, dynamic>?;
        return data;
      },
    );
  }

  @override
  Future<void> createUserProfile({
    required String uid,
    required String email,
    required String username,
    required File? image,
  }) async {
    String imageUrl = '';
    if (image != null) {
      imageUrl = await _uploadImage(uid, image);
    }
    await _users.doc(uid).set({
      'uid': uid,
      'email': email,
      'username': username,
      'image_path': imageUrl,
    });
  }

  @override
  Future<void> updateUserProfile({
    required String uid,
    required String username,
    required File? image,
  }) async {
    String imageUrl = '';
    if (image != null) {
      imageUrl = await _uploadImage(uid, image);
    }
    if (imageUrl.isEmpty) {
      await _users.doc(uid).update({'username': username});
    } else {
      await _users.doc(uid).update({'username': username, 'image_path': imageUrl});
    }
  }

  Future<String> _uploadImage(String uid, File image) async {
    final imageRef = _storage.ref(uid);
    await imageRef.putFile(image);
    return await imageRef.getDownloadURL();
  }
}
