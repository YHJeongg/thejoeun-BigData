import 'package:flutter/material.dart';

import '../model/message.dart';

class InsertList extends StatefulWidget {
  const InsertList({super.key});

  @override
  State<InsertList> createState() => _InsertListState();
}

class _InsertListState extends State<InsertList> {
  late TextEditingController textEditingController;
  late List switchValue;

  @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController();
    switchValue = [true, false, false];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add View'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('구매'),
                  Switch(
                    value: switchValue[0],
                    onChanged: (value) {
                      setState(
                        () {
                          switchValue = [value, false, false];
                          if (value == false) {
                            switchValue = [true, false, false];
                          }
                        },
                      );
                    },
                  ),
                  Image.asset('images/cart.png'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('약속'),
                  Switch(
                    value: switchValue[1],
                    onChanged: (value) {
                      setState(
                        () {
                          switchValue = [false, value, false];
                          if (value == false) {
                            switchValue = [true, false, false];
                          }
                        },
                      );
                    },
                  ),
                  Image.asset('images/clock.png'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('스터디'),
                  Switch(
                    value: switchValue[2],
                    onChanged: (value) {
                      setState(
                        () {
                          switchValue = [false, false, value];
                          if (value == false) {
                            switchValue = [true, false, false];
                          }
                        },
                      );
                    },
                  ),
                  Image.asset('images/pencil.png'),
                ],
              ),
              TextField(
                controller: textEditingController,
                decoration: const InputDecoration(
                  label: Text('목록을 입력하세요.'),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              ElevatedButton(
                onPressed: () {
                  if (textEditingController.text.trim().isNotEmpty) {
                    addList();
                  }
                  Navigator.pop(context);
                },
                child: const Text(
                  'OK',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  addList() {
    Message.workList = textEditingController.text.trim();
    Message.action = true;
    if (switchValue[0]) {
      Message.imagePath = 'images/cart.png';
    }
    if (switchValue[1]) {
      Message.imagePath = 'images/clock.png';
    }
    if (switchValue[2]) {
      Message.imagePath = 'images/pencil.png';
    }
  }
}
