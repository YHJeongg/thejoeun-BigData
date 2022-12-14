import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late String sum;
  late TextEditingController value1;
  late TextEditingController value2;

  @override
  void initState() {
    super.initState();
    sum = '';
    value1 = TextEditingController();
    value2 = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('간단한 덧셈 계산기'),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(15),
                child: Text(
                  '계산 결과 : $sum',
                  style: const TextStyle(fontSize: 20),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: value1,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: value2,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
                child: ElevatedButton(
                  onPressed: () {
                    setState(
                      () {
                        if (value1.value.text.trim().isEmpty ||
                            value2.value.text.trim().isEmpty) {
                          errorSnackBar(context);
                        } else {
                          int result = int.parse(value1.value.text) +
                              int.parse(value2.value.text);
                          sum = '$result';
                        }
                      },
                    );
                  },
                  child: Row(
                    children: const <Widget>[
                      Padding(
                        padding: EdgeInsets.only(right: 20),
                        child: Icon(Icons.add),
                      ),
                      Text('덧셈 계산'),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: ElevatedButton(
                  onPressed: () {
                    setState(
                      () {
                        if (value1.value.text.trim().isEmpty ||
                            value2.value.text.trim().isEmpty) {
                          errorSnackBar(context);
                        } else {
                          int result = int.parse(value1.value.text) -
                              int.parse(value2.value.text);
                          sum = '$result';
                        }
                      },
                    );
                  },
                  child: Row(
                    children: const <Widget>[
                      Padding(
                        padding: EdgeInsets.only(right: 20),
                        child: Icon(Icons.remove),
                      ),
                      Text('뺄셈 계산'),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: ElevatedButton(
                  onPressed: () {
                    setState(
                      () {
                        if (value1.value.text.trim().isEmpty ||
                            value2.value.text.trim().isEmpty) {
                          errorSnackBar(context);
                        } else {
                          int result = int.parse(value1.value.text) *
                              int.parse(value2.value.text);
                          sum = '$result';
                        }
                      },
                    );
                  },
                  child: Row(
                    children: const <Widget>[
                      Padding(
                        padding: EdgeInsets.only(right: 20),
                        child: Icon(Icons.clear),
                      ),
                      Text('곱셈 계산'),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: ElevatedButton(
                  onPressed: () {
                    setState(
                      () {
                        if (value1.value.text.trim().isEmpty ||
                            value2.value.text.trim().isEmpty) {
                          errorSnackBar(context);
                        } else {
                          double result = int.parse(value1.value.text) /
                              int.parse(value2.value.text);
                          sum = '$result';
                        }
                      },
                    );
                  },
                  child: Row(
                    children: const <Widget>[
                      Padding(
                        padding: EdgeInsets.only(right: 20),
                        child: Icon(Icons.percent),
                      ),
                      Text('나눗셈 계산'),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  errorSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('숫자를 입력하세요.'),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.red,
      ),
    );
  }
}
