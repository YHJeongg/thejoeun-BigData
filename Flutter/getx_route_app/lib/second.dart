import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_route_app/home.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  var value = Get.arguments ?? "_";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Get.back();
              },
              child: const Text('이전 화면'),
            ),
            Text('Multiple Argument #1 : ${value[0]}'),
            Text('Multiple Argument #2 : ${value[1]}'),
          ],
        ),
      ),
    );
  }
}
