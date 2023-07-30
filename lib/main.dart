import 'package:auto_vault/app/app.dart';
import 'package:auto_vault/di.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // init bloc observer here

  await Firebase.initializeApp();

  await DI.init();

  runApp(const App());
}
