import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late String charName;
  late int charNum;
  late String name;

  @override
  void initState() {
    super.initState();
    charName = '';
    charNum = 1;
    name = "대한민국";

    // Timer
    Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        changeChar();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      appBar: AppBar(
        title: const Text('LED 광고'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              charName,
              style: const TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  changeChar() {
    setState(
      () {
        charName = name.substring(0, charNum);
        charNum++;
        if (charNum > 4) {
          charNum = 1;
        }
      },
    );
  }
}
