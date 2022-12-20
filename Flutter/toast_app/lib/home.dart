import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Toast Message'),
        centerTitle: true,
      ),
      body: const MyToast(),
    );
  }
} // Home End

class MyToast extends StatelessWidget {
  const MyToast({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          flutterToast();
        },
        child: const Text('Toast Button'),
      ),
    );
  }

  flutterToast() {
    Fluttertoast.showToast(
      msg: 'Toast Button is Clicked',
      gravity: ToastGravity.TOP,
      fontSize: 20,
      toastLength: Toast.LENGTH_SHORT,
      backgroundColor: Colors.amber,
      textColor: Colors.white,
    );
  }
} // MyToast End
