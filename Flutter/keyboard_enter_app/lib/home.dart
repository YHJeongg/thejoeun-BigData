import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late TextEditingController textEditingController;
  late String inputValue;

  @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController();
    inputValue = '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Keyboard Enter'),
      ),
      body: Center(
        child: Column(
          children: [
            TextField(
              controller: textEditingController,
              decoration: const InputDecoration(labelText: '글자를 입력하세요.'),
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.go,
              onSubmitted: (value) {
                setState(() {
                  inputValue = textEditingController.text;
                });
              },
            ),
            Text(inputValue),
          ],
        ),
      ),
    );
  }
}
