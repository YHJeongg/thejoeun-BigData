import 'package:flutter/material.dart';
import 'package:navigator_lamp_app/view/edit_page.dart';

class Home extends StatefulWidget {
  const Home({super.key, required this.editText, required this.switchValue});

  final TextEditingController editText;
  final bool switchValue;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late TextEditingController textEditingController;
  late String imagePath;

  @override
  void initState() {
    super.initState();
    textEditingController = widget.editText;
    if (widget.switchValue) {
      imagePath = 'images/lamp_on.png';
    } else {
      imagePath = 'images/lamp_off.png';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main 화면'),
        leading: IconButton(
          onPressed: () {
            //
          },
          icon: const Icon(Icons.home),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return EditPage(
                        homeText: textEditingController,
                        homeSwitchValue: widget.switchValue);
                  },
                ),
              );
            },
            icon: const Icon(Icons.edit),
          ),
        ],
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
            const SizedBox(
              height: 50,
            ),
            SizedBox(
              width: 300,
              height: 300,
              child: Image.asset(imagePath),
            ),
          ],
        ),
      ),
    );
  }
}
