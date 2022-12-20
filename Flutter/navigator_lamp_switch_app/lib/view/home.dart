import 'package:flutter/material.dart';
import 'package:navigator_lamp_switch_app/model/message.dart';
import 'package:navigator_lamp_switch_app/view/edit_page.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late String imagePath;
  late bool switchOnOff;
  late bool switchRedYellow;

  @override
  void initState() {
    super.initState();

    if (Message.switchOnOff) {
      if (Message.switchRedYellow) {
        imagePath = 'images/lamp_red.png';
      } else {
        imagePath = 'images/lamp_on.png';
      }
    } else {
      imagePath = 'images/lamp_off.png';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main 화면'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const EditPage();
                  },
                ),
              ).then(
                (value) => (value) {
                  setState(() {
                    switchOnOff = value[0];
                    switchRedYellow = value[1];
                  });
                },
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
            Image.asset(
              imagePath,
              width: 150,
            ),
          ],
        ),
      ),
    );
  }
}
