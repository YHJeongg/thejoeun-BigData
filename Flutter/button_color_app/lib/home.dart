import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late String _buttonText;

  @override
  void initState() {
    super.initState();
    _buttonText = 'Hello';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Change button color & text'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                _onClick();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    _buttonText == 'Hello' ? Colors.blue : Colors.orange,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    10,
                  ),
                ),
              ),
              child: Text(
                _buttonText,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onClick() {
    setState(() {
      if (_buttonText == 'Hello') {
        _buttonText = 'Flutter';
      } else {
        _buttonText = 'Hello';
      }
    });
  }
}
