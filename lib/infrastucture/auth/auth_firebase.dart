import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class IAuthFirebase {
  Stream<bool> get authStateChanges;
  String get getUserId;
  String get getEmail;
  Future<void> signIn({
    required String email,
    required String password,
  });
  Future<void> signUp({
    required String email,
    required String password,
  });
  Future<void> signInWithGoogle();
  Future<void> signOut();
  Future<void> resetPassword({
    required String email,
  });
}

class AuthFirebase implements IAuthFirebase {
  final FirebaseAuth _firebaseAuth;

  AuthFirebase({
    required FirebaseAuth firebaseAuth,
  }) : _firebaseAuth = firebaseAuth;

  @override
  Stream<bool> get authStateChanges {
    return _firebaseAuth.authStateChanges().map((user) => user != null);
  }

  @override
  String get getUserId => _firebaseAuth.currentUser != null ? _firebaseAuth.currentUser!.uid : '';

  @override
  String get getEmail => _firebaseAuth.currentUser != null ? _firebaseAuth.currentUser!.email! : '';

  @override
  Future<void> signUp({required String email, required String password}) async {
    await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  @override
  Future<void> signIn({required String email, required String password}) async {
    await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  @override
  Future<void> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    await FirebaseAuth.instance.signInWithCredential(credential);
  }

  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  @override
  Future<void> resetPassword({required String email}) async {
    await _firebaseAuth.sendPasswordResetEmail(email: email);
  }
}
