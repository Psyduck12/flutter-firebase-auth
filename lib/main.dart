import 'package:firebase_auth_app/presentation/core/chat_app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth_app/get_it.dart' as get_it;

void main() async {
  await init();
  runApp(const ChatApp());
}

Future<void> init() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  get_it.setup();
}
