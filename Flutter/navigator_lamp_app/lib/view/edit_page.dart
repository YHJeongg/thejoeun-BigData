import 'package:flutter/material.dart';
import 'package:navigator_lamp_app/view/home.dart';

class EditPage extends StatefulWidget {
  const EditPage(
      {super.key, required this.homeText, required this.homeSwitchValue});

  final TextEditingController homeText;
  final bool homeSwitchValue;

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  late TextEditingController textEditingController;
  late bool switchValue;

  @override
  void initState() {
    super.initState();
    textEditingController = widget.homeText;
    switchValue = widget.homeSwitchValue;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('수정화면'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                controller: textEditingController,
                decoration: const InputDecoration(
                  labelText: '글자를 입력하세요.',
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('On'),
                Switch(
                  value: switchValue,
                  onChanged: (value) {
                    setState(() {
                      switchValue = value;
                    });
                  },
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return Home(
                          editText: textEditingController,
                          switchValue: switchValue);
                    },
                  ),
                );
              },
              child: const Text('OK'),
            ),
          ],
        ),
      ),
    );
  }
}
