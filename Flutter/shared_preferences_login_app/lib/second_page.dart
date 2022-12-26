import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  late String userId;
  late String password;

  @override
  void initState() {
    super.initState();
    userId = '';
    password = '';
    _initSharedPreferences();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ID와 Password 출력'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('User ID : $userId'),
            Text('Password : $password'),
          ],
        ),
      ),
    );
  }

  // ---Functions---
  _initSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      userId = (prefs.getString('p_userId'))!;
      password = (prefs.getString('p_password'))!;
    });
  }
} // End

