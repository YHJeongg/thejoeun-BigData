import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late String _lampImage; // Image Name
  late String _dialogText; // button title
  late String _dialogTitle; // button title
  late bool _lampStatus; // 현재 화면의 Lamp 상태
  late String _buttonText1;
  late String _buttonText2;

  @override
  void initState() {
    super.initState();
    _lampImage = 'images/lamp_on.png';
    _dialogText = '현재 램프가 켜진 상태 입니다.';
    _dialogTitle = '경고';
    _lampStatus = true;
    _buttonText1 = '네, 알겠습니다.';
    _buttonText2 = '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Alert를 이용한 메세지 출력"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  _lampImage,
                  width: 300,
                  height: 600,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => _showDialogOn(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                  ),
                  child: const Text('켜기'),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: ElevatedButton(
                    onPressed: () => _showDialogOff(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                    child: const Text('끄기'),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  _showDialogOn(BuildContext context) {
    if (_lampStatus == false) {
      _dialogText = '램프를 켜시겠습니까?';
      _dialogTitle = '램프 켜기';
      _buttonText1 = '네';
      _buttonText2 = '아니오';
    } else {
      _dialogText = '현재 램프가 켜진 상태 입니다.';
      _dialogTitle = '경고';
      _buttonText1 = '네, 알겠습니다.';
      _buttonText2 = '';
    }

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext ctx) {
        return AlertDialog(
          title: Text(_dialogTitle),
          content: Text(_dialogText),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(ctx);
                setState(() {
                  _lampImage = 'images/lamp_on.png';
                  _lampStatus = true;
                });
              },
              child: Text(_buttonText1),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(ctx);
                setState(() {
                  _lampImage = 'images/lamp_off.png';
                  _lampStatus = false;
                });
              },
              child: Text(_buttonText2),
            ),
          ],
        );
      },
    );
  }

  _showDialogOff(BuildContext context) {
    if (_lampStatus == true) {
      _dialogText = '램프를 끄시겠습니까?';
      _dialogTitle = '램프 끄기';
      _buttonText1 = '네';
      _buttonText2 = '아니오';
    } else {
      _dialogText = '현재 램프가 꺼진 상태입니다.';
      _dialogTitle = '경고';
      _buttonText1 = '네, 알겠습니다.';
      _buttonText2 = '';
    }

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext ctx) {
        return AlertDialog(
          title: Text(_dialogTitle),
          content: Text(_dialogText),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(ctx);
                setState(() {
                  _lampImage = 'images/lamp_off.png';
                  _lampStatus = false;
                });
              },
              child: Text(_buttonText1),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(ctx);
                setState(() {
                  _lampImage = 'images/lamp_on.png';
                  _lampStatus = true;
                });
              },
              child: Text(_buttonText2),
            ),
          ],
        );
      },
    );
  }
} // end

