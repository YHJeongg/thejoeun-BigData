import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List<TextEditingController> textFieldList;
  late Operator operator;
  late List<bool> switchValue;

  @override
  void initState() {
    super.initState();

    textFieldList = [
      TextEditingController(),
      TextEditingController(),
      TextEditingController(),
      TextEditingController(),
      TextEditingController(),
      TextEditingController(),
    ];
    switchValue = [
      false,
      false,
      false,
      false,
    ];
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
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Center(
              child: Column(
                children: [
                  TextField(
                    controller: textFieldList[0],
                    decoration: const InputDecoration(
                      labelText: '첫번째 숫자를 입력하세요',
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  TextField(
                    controller: textFieldList[1],
                    decoration: const InputDecoration(
                      labelText: '두번째 숫자를 입력하세요',
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(
                    width: 500,
                    height: 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            setState(
                              () {
                                if (textFieldList[0].text.trim().isEmpty ||
                                    textFieldList[1].text.trim().isEmpty) {
                                  errorSnackBar(context);
                                } else if (textFieldList[1].text.trim() ==
                                    '0') {
                                  errorSnackBar2(context);
                                } else {
                                  calc(context);
                                }
                              },
                            );
                          },
                          child: const Text('계산하기'),
                        ),
                        const SizedBox(
                          width: 40,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            setState(
                              () {
                                for (var controller in textFieldList) {
                                  controller.text = '';
                                }
                              },
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                          ),
                          child: const Text('지우기'),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      const Text('덧셈 : '),
                      Switch(
                        value: switchValue[0],
                        onChanged: (value) {
                          setState(() {
                            switchValue[0] = value;
                          });
                        },
                      ),
                      const Text('뺄셈 : '),
                      Switch(
                        value: switchValue[1],
                        onChanged: (value) {
                          setState(() {
                            switchValue[1] = value;
                          });
                        },
                      ),
                      const Text('곱셈 : '),
                      Switch(
                        value: switchValue[2],
                        onChanged: (value) {
                          setState(() {
                            switchValue[2] = value;
                          });
                        },
                      ),
                      const Text('나눗셈 : '),
                      Switch(
                        value: switchValue[3],
                        onChanged: (value) {
                          setState(() {
                            switchValue[3] = value;
                          });
                        },
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: textFieldList[2],
                      decoration: const InputDecoration(
                        labelText: '덧셈 결과',
                      ),
                      readOnly: true,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: textFieldList[3],
                      decoration: const InputDecoration(
                        labelText: '뺼셈 결과',
                      ),
                      readOnly: true,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: textFieldList[4],
                      decoration: const InputDecoration(
                        labelText: '곱셈 결과',
                      ),
                      readOnly: true,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: textFieldList[5],
                      decoration: const InputDecoration(
                        labelText: '나눗셈 결과',
                      ),
                      readOnly: true,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  errorSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          '숫자를 입력하여 주세요',
        ),
        duration: Duration(
          seconds: 1,
        ),
        backgroundColor: Colors.red,
      ),
    );
  }

  errorSnackBar2(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          '두번째 숫자에 0을 입력할 수 없어요',
        ),
        duration: Duration(
          seconds: 3,
        ),
        backgroundColor: Colors.red,
      ),
    );
  }

  calc(BuildContext context) {
    int num1 = int.parse(textFieldList[0].text.trim());
    int num2 = int.parse(textFieldList[1].text.trim());

    String addStr = oper(num1, num2, operator = add);
    String subStr = oper(num1, num2, operator = sub);
    String mulStr = oper(num1, num2, operator = mul);
    String divStr = oper(num1, num2, operator = div);

    if (switchValue[0] != false) {
      textFieldList[2].text = addStr;
    } else {
      textFieldList[2].text = '';
    }
    if (switchValue[1] != false) {
      textFieldList[3].text = subStr;
    } else {
      textFieldList[3].text = '';
    }
    if (switchValue[2] != false) {
      textFieldList[4].text = mulStr;
    } else {
      textFieldList[4].text = '';
    }
    if (switchValue[3] != false) {
      textFieldList[5].text = divStr;
    } else {
      textFieldList[5].text = '';
    }
  }
}

// 4칙연산 typedef 만들기
typedef Operator = String Function(int num1, int num2);

String add(int num1, int num2) => '${num1 + num2}';
String sub(int num1, int num2) => '${num1 - num2}';
String mul(int num1, int num2) => '${num1 * num2}';
String div(int num1, int num2) => '${num1 / num2}';

String oper(int num1, int num2, Operator operator) {
  return operator(num1, num2);
}
