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
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Image Fitting"),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "images/smile2.jpeg",
              width: 200,
              height: 200,
              fit: BoxFit.contain,
            ),
            Image.asset(
              "images/smile2.jpeg",
              width: 200,
              height: 200,
              fit: BoxFit.fill,
            ),
            Image.asset(
              "images/smile2.jpeg",
              width: 200,
              height: 200,
              fit: BoxFit.cover,
            ),
            Image.asset(
              "images/smile2.jpeg",
              width: 200,
              height: 200,
              fit: BoxFit.contain,
            ),
            Image.asset(
              "images/smile2.jpeg",
              width: 200,
              height: 200,
              fit: BoxFit.contain,
            ),
            Image.asset(
              "images/smile2.jpeg",
              width: 200,
              height: 200,
              fit: BoxFit.contain,
            ),
            Image.asset(
              "images/smile2.jpeg",
              width: 200,
              height: 200,
              fit: BoxFit.contain,
            ),
            Image.asset(
              "images/smile2.jpeg",
              width: 200,
              height: 200,
              fit: BoxFit.contain,
            ),
            Image.asset(
              "images/smile2.jpeg",
              width: 200,
              height: 200,
              fit: BoxFit.contain,
            ),
            Image.asset(
              "images/smile2.jpeg",
              width: 200,
              height: 200,
              fit: BoxFit.contain,
            ),
            Image.asset(
              "images/smile2.jpeg",
              width: 200,
              height: 200,
              fit: BoxFit.contain,
            ),
          ],
        )),
      ),
    );
  }
}
