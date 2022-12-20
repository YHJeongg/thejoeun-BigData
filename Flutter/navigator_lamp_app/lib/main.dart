import 'package:flutter/material.dart';
import 'package:navigator_lamp_app/view/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(
        editText: TextEditingController(),
        switchValue: true,
      ),
    );
  }
}
