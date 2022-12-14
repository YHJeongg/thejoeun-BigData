import 'package:alert_dialog_ex_app/secondpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alert Dialog with Gesture'),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () => _showDialog(context),
          child: const Text(
            'Move the 2nd page.',
          ),
        ),
      ),
    );
  }
}

_showDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false, // user must tap the button
    builder: (BuildContext ctx) {
      return AlertDialog(
        title: const Text('Page 이동'),
        content: const Text('아래의 버튼을 누르면 페이지 이동을 합니다.'),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.pop(ctx);
              Navigator.push(
                ctx,
                MaterialPageRoute(
                  builder: (ctx) => const SecondPage(),
                ),
              );
            },
            child: const Text('Page 이동'),
          ),
        ],
      );
    },
  );
}
