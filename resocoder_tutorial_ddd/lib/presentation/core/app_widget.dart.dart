import 'package:flutter/material.dart';
import 'package:resocoder_tutorial_ddd/presentation/sign_in/sign_in_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notes',
      home: SignInPage(),
      theme: ThemeData.light().copyWith(
        primaryColor: Colors.green,
        accentColor: Colors.blueAccent,
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
