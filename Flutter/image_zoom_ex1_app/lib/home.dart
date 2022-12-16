import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late String _lampImage; // Image Name
  late double _lampWidth; // Image width
  late double _lampHeight; // Image Height
  late String _buttonName; // button title
  late bool _switch; // switch 상태
  late bool _lampSizeStatus; // 현재 화면의 Lamp 크기

  @override
  void initState() {
    super.initState();
    _lampImage = 'images/lamp_on.png';
    _lampWidth = 150;
    _lampHeight = 300;
    _buttonName = '전구 확대';
    _switch = true;
    _lampSizeStatus = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Image 확대 및 축소"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 350,
              height: 650,
              child: RotationTransition(
                turns: const AlwaysStoppedAnimation(-45 / 360),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      _lampImage,
                      width: _lampWidth,
                      height: _lampHeight,
                    ),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text(
                      _buttonName,
                      style: const TextStyle(
                        fontSize: 10,
                      ),
                    ),
                    Switch(
                      value: _lampSizeStatus,
                      onChanged: (value) {
                        setState(() {
                          _lampSizeStatus = value;
                        });
                        decisionLampSize();
                      },
                    ),
                  ],
                ),
                Column(
                  children: [
                    const Text(
                      '전구스위치',
                      style: TextStyle(
                        fontSize: 10,
                      ),
                    ),
                    Switch(
                      value: _switch,
                      onChanged: (value) {
                        setState(() {
                          _switch = value;
                        });
                        decisionOnOff();
                      },
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  // --- Function ---
  decisionLampSize() {
    if (_lampSizeStatus == true) {
      setState(
        () {
          _lampWidth = 300;
          _lampHeight = 600;
          _buttonName = '전구 축소';
        },
      );
    } else {
      setState(
        () {
          _lampWidth = 150;
          _lampHeight = 300;
          _buttonName = '전구 확대';
        },
      );
    }
  }

  decisionOnOff() {
    if (_switch) {
      setState(
        () {
          _lampImage = 'images/lamp_on.png';
        },
      );
    } else {
      setState(
        () {
          _lampImage = 'images/lamp_off.png';
        },
      );
    }
  }
} // end
