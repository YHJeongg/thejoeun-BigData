import 'package:flutter/material.dart';
import 'package:navigator_lamp_switch_app/model/message.dart';

class EditPage extends StatefulWidget {
  const EditPage({super.key});

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  late bool switchRed;
  late bool switchOnOff;
  late String textOnOff;
  late String textRedYellow;

  @override
  void initState() {
    super.initState();
    switchRed = false;
    switchOnOff = true;
    textOnOff = 'On';
    textRedYellow = 'Yellow';
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(textRedYellow),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Switch(
                    value: switchRed,
                    onChanged: (value) {
                      setState(
                        () {
                          switchRed = value;
                          if (switchRed) {
                            textRedYellow = 'Red';
                          } else {
                            textRedYellow = 'Yellow';
                          }
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(textOnOff),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Switch(
                    value: switchOnOff,
                    onChanged: (value) {
                      setState(
                        () {
                          switchOnOff = value;
                          if (switchOnOff) {
                            textOnOff = 'On';
                          } else {
                            textOnOff = 'Off';
                          }
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: ElevatedButton(
                onPressed: () {
                  _switchValue();
                  Navigator.pop(context, Message.value);
                },
                child: const Text('OK'),
              ),
            )
          ],
        ),
      ),
    );
  }

  _switchValue() {
    Message.value[0] = switchOnOff;
    Message.value[1] = switchRed;
  }
}
