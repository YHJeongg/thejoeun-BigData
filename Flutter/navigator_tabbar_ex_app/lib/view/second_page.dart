import 'package:flutter/material.dart';

import '../model/message.dart';
import '../model/todo_list.dart';

enum radioValue { A, B, C }

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  late TextEditingController textEditingController;
  late List<ImageList> imageList;
  late radioValue valueCategory;
  late bool checkFly;
  late String valueAnimal;
  late String valueCategoryName;
  late double imageWidth;
  late double imageHeight;

  @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController();

    imageList = [];
    imageList.add(ImageList(imagePath: 'images/bee.png'));
    imageList.add(ImageList(imagePath: 'images/cat.png'));
    imageList.add(ImageList(imagePath: 'images/cow.png'));
    imageList.add(ImageList(imagePath: 'images/dog.png'));
    imageList.add(ImageList(imagePath: 'images/fox.png'));
    imageList.add(ImageList(imagePath: 'images/monkey.png'));
    imageList.add(ImageList(imagePath: 'images/pig.png'));
    imageList.add(ImageList(imagePath: 'images/wolf.png'));

    valueCategory = radioValue.A;
    checkFly = false;
    valueAnimal = '';
    valueCategoryName = '양서류';
    imageWidth = 80;
    imageHeight = 80;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Listview Test'),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
              child: TextField(
                controller: textEditingController,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 130,
                  child: RadioListTile(
                    title: const Text(
                      '양서류',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    value: radioValue.A,
                    groupValue: valueCategory,
                    onChanged: (value) {
                      setState(() {
                        valueCategory = value!;
                        valueCategoryName = '양서류';
                      });
                    },
                  ),
                ),
                SizedBox(
                  width: 130,
                  child: RadioListTile(
                    title: const Text(
                      '파충류',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    value: radioValue.B,
                    groupValue: valueCategory,
                    onChanged: (value) {
                      setState(() {
                        valueCategory = value!;
                        valueCategoryName = '파충류';
                      });
                    },
                  ),
                ),
                SizedBox(
                  width: 130,
                  child: RadioListTile(
                    title: const Text(
                      '포유류',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    value: radioValue.C,
                    groupValue: valueCategory,
                    onChanged: (value) {
                      setState(() {
                        valueCategory = value!;
                        valueCategoryName = '포유류';
                      });
                    },
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.only(right: 100),
                  child: Text(
                    '날 수 있나요?',
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ),
                Checkbox(
                  value: checkFly,
                  onChanged: (value) {
                    setState(() {
                      checkFly = value!;
                    });
                  },
                ),
              ],
            ),
            SafeArea(
              child: SizedBox(
                height: 80,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: imageList.length,
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            valueAnimal = imageList[index].imagePath;
                          },
                          child: Image.asset(
                            imageList[index].imagePath,
                            width: imageWidth,
                            height: imageHeight,
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                _sendValue();
              },
              child: const Text(
                '동물 추가하기',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _sendValue() {
    Message.name = textEditingController.text.trim();
    Message.imagePath = valueAnimal;
    Message.action = true;
    Message.category = valueCategoryName;
    Message.todoList.add(TodoList(
        imagePath: valueAnimal,
        name: textEditingController.text.trim(),
        category: valueCategoryName));
  }
}
