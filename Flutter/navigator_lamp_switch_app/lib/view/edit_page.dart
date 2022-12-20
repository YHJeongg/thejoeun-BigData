import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class EditPage extends StatefulWidget {
  const EditPage({super.key});

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  late bool switchRed;
  late bool switchOnOff;

  @override
  void initState() {
    super.initState();
    switchRed = false;
    switchOnOff = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('수정화면'),
      ),
      body: Center(
        child: Column(
          children: [
            Row(
              children: [
                const Text('Red'),
                Switch(
                  value: switchRed,
                  onChanged: (value) {
                    setState(
                      () {
                        switchRed = value;
                      },
                    );
                  },
                ),
              ],
            ),
            Row(
              children: [
                const Text('On'),
                Switch(
                  value: switchOnOff,
                  onChanged: (value) {
                    setState(
                      () {
                        switchOnOff = value;
                      },
                    );
                  },
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                //
              },
              child: const Text('OK'),
            )
          ],
        ),
      ),
    );
  }
}
