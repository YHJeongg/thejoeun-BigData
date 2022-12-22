import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/message.dart';

class InsertList extends StatefulWidget {
  const InsertList({super.key});

  @override
  State<InsertList> createState() => _InsertListState();
}

class _InsertListState extends State<InsertList> {
  late TextEditingController textEditingController;
  late List imageName;
  late int selectedItem;

  @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController();
    imageName = [
      'cart.png',
      'clock.png',
      'pencil.png',
    ];
    selectedItem = 0;
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
              SizedBox(
                width: 300,
                height: 200,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 100,
                      height: 200,
                      child: Image.asset(
                        'images/${imageName[selectedItem]}',
                        width: 200,
                        height: 400,
                      ),
                    ),
                    SizedBox(
                      width: 150,
                      height: 300,
                      child: CupertinoPicker(
                        backgroundColor: Colors.blue,
                        itemExtent: 50,
                        scrollController:
                            FixedExtentScrollController(initialItem: 0),
                        onSelectedItemChanged: (value) {
                          setState(() {
                            selectedItem = value;
                          });
                        },
                        children: [
                          Image.asset(
                            'images/${imageName[0]}',
                          ),
                          Image.asset(
                            'images/${imageName[1]}',
                          ),
                          Image.asset(
                            'images/${imageName[2]}',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
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
    Message.imagePath = 'images/${imageName[selectedItem]}';
    Message.action = true;
  }
}
