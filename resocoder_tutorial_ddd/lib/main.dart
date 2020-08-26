import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:resocoder_tutorial_ddd/injection.dart';
import 'package:resocoder_tutorial_ddd/presentation/core/app_widget.dart.dart';

void main() {
  configureInjection(Environment.prod);
  runApp(AppWidget());
}
