import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class SecondPage extends StatefulWidget {
  final String id;
  final String pw;

  const SecondPage({super.key, required this.id, required this.pw});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('${widget.id}님 Welcome'),
      ),
      body: const Center(
        child: CircleAvatar(
          backgroundImage: AssetImage('images/bitcoin.jpg'),
          radius: 100,
        ),
      ),
    );
  }
}
