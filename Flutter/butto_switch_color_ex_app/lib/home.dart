import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late bool _buttonText;

  @override
  void initState() {
    super.initState();
    _buttonText = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Change button color on Switch'),
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
                    _buttonText == false ? Colors.blue : Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    10,
                  ),
                ),
              ),
              child: Text(
                _buttonText == false ? 'Hello' : 'Flutter',
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
              child: Switch(
                value: _buttonText,
                onChanged: (value) {
                  setState(
                    () {
                      _buttonText = value;
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onClick() {
    setState(() {
      if (_buttonText == false) {
        _buttonText = true;
      } else {
        _buttonText = false;
      }
    });
  }
}
