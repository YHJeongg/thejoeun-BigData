import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late TextEditingController value1;
  late TextEditingController value2;
  late String sum;
  late String subtract;
  late String multiply;
  late String divide;

  @override
  void initState() {
    super.initState();
    value1 = TextEditingController();
    value2 = TextEditingController();
    sum = '';
    subtract = '';
    multiply = '';
    divide = '';
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('간단한 계산기'),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                TextField(
                  controller: value1,
                  decoration: const InputDecoration(
                    labelText: '첫번째 숫자를 입력 하세요.',
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: value2,
                  decoration: const InputDecoration(
                    labelText: '두번째 숫자를 입력 하세요.',
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        if (value1.text.trim().isEmpty ||
                            value2.text.trim().isEmpty) {
                          errorSnackBar(context);
                        } else if (value1.text.trim() == "0" ||
                            value2.text.trim() == "0") {
                          error0SnackBar(context);
                        } else {
                          int result1 = int.parse(value1.value.text) +
                              int.parse(value2.value.text);
                          sum = '$result1';
                          int result2 = int.parse(value1.value.text) -
                              int.parse(value2.value.text);
                          subtract = '$result2';
                          int result3 = int.parse(value1.value.text) *
                              int.parse(value2.value.text);
                          multiply = '$result3';
                          double result4 = int.parse(value1.value.text) /
                              int.parse(value2.value.text);
                          divide = '$result4';
                        }
                      },
                      child: const Text('계산하기'),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: ElevatedButton(
                        onPressed: () {
                          value1.text = '';
                          value2.text = '';
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                        ),
                        child: const Text('지우기'),
                      ),
                    ),
                  ],
                ),
                TextField(
                  controller: TextEditingController(text: sum),
                  decoration: const InputDecoration(
                    labelText: '덧셈 결과',
                  ),
                  readOnly: true,
                ),
                TextField(
                  controller: TextEditingController(text: subtract),
                  decoration: const InputDecoration(
                    labelText: '뺄셈 결과',
                  ),
                  readOnly: true,
                ),
                TextField(
                  controller: TextEditingController(text: multiply),
                  decoration: const InputDecoration(
                    labelText: '곱셈 결과',
                  ),
                  readOnly: true,
                ),
                TextField(
                  controller: TextEditingController(text: divide),
                  decoration: const InputDecoration(
                    labelText: '나눗셈 결과',
                  ),
                  readOnly: true,
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

  error0SnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('0은 입력이 안됩니다.'),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.red,
      ),
    );
  }
}
