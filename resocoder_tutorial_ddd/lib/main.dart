import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:resocoder_tutorial_ddd/injection.dart';
import 'package:resocoder_tutorial_ddd/presentation/core/app_widget.dart.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // injectable
  configureInjection(Environment.prod);
  runApp(AppWidget());
}
