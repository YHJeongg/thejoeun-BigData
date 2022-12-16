import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 241, 178, 199),
      appBar: AppBar(
        title: const Text("피카츄 이미지 탭바"),
        backgroundColor: Colors.pink,
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Padding(
            padding: EdgeInsets.all(10.0),
            child: CircleAvatar(
              backgroundImage: AssetImage("images/pikachu1.png"),
              radius: 50,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: CircleAvatar(
              backgroundImage: AssetImage("images/pikachu2.png"),
              radius: 50,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: CircleAvatar(
              backgroundImage: AssetImage("images/pikachu3.png"),
              radius: 50,
            ),
          )
        ],
      )),
    );
  }
}
