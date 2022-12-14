import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late TextEditingController textEditingController1;
  late TextEditingController textEditingController2;
  late int num1; // 사용자의 입력 내용
  late int num2; // 사용자의 입력 내용
  late int sum;
  late String value;

  @override
  void initState() {
    super.initState();
    textEditingController1 = TextEditingController();
    textEditingController2 = TextEditingController();
    num1 = 0;
    num2 = 0;
    sum = 0;
    value = "";
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Single Textfield'),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                TextField(
                  controller: textEditingController1,
                  decoration: const InputDecoration(
                    labelText: '첫번째 숫자를 입력 하세요.',
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: textEditingController2,
                  decoration: const InputDecoration(
                    labelText: '두번째 숫자를 입력 하세요.',
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (textEditingController1.text.trim().isEmpty ||
                        textEditingController2.text.trim().isEmpty) {
                      errorSnackBar(context);
                    } else {
                      showSnackBar(context);
                    }
                  },
                  child: const Text('덧셈 계산'),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                  child: Text(
                    value,
                    style: const TextStyle(
                      color: Colors.red,
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Date : 2022-12-14
  // Desc: 텍스트 필드에 입력을 안하고 버튼을 눌렀을 경우
  errorSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('숫자를 입력하세요.'),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.red,
      ),
    );
  }

  // Date : 2022-12-14
  // Desc: 텍스트 필드에 입력을 하고 버튼을 눌렀을 경우
  showSnackBar(BuildContext context) {
    setState(
      () {
        sum = int.parse(textEditingController1.value.text) +
            int.parse(textEditingController2.value.text);
      },
    );
    if (sum == 0) {
      value = '';
    } else {
      value = '입력하신 숫자의 합은 $sum 입니다.';
    }
  }
}
