import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ReceivedMail extends StatelessWidget {
  const ReceivedMail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Received Mail'),
        backgroundColor: Colors.red,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 50, 0, 0),
        child: Column(
          children: [
            const Text(
              '유비에게 보낸 메일',
            ),
            const Text(
              '관우에게 보낸 메일',
            ),
            const Text(
              '장비에게 보낸 메일',
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, '/');
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.red),
              ),
              child: const Text('Go Home'),
            ),
          ],
        ),
      ),
    );
  }
}
