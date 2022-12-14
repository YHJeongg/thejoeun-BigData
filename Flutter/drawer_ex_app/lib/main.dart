import 'package:drawer_ex_app/home.dart';
import 'package:drawer_ex_app/receivedmail.dart';
import 'package:drawer_ex_app/sendmail.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const Home(),
        '/sm': (context) => const SendMail(),
        '/rm': (context) => const ReceivedMail(),
      },
    );
  }
}
