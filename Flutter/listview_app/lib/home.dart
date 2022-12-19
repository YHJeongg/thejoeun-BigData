import 'package:flutter/material.dart';

import 'model/todo_list.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List<TodoList> todoList;

  @override
  void initState() {
    super.initState();
    todoList = [];

    todoList
        .add(TodoList(imagePath: 'images/bee.png', name: '벌', category: '곤충'));
    todoList.add(
        TodoList(imagePath: 'images/cat.png', name: '고양이', category: '포유류'));
    todoList.add(
        TodoList(imagePath: 'images/cow.png', name: '젖소', category: '포유류'));
    todoList.add(
        TodoList(imagePath: 'images/dog.png', name: '강아지', category: '포유류'));
    todoList.add(
        TodoList(imagePath: 'images/fox.png', name: '여우', category: '포유류'));
    todoList.add(
        TodoList(imagePath: 'images/monkey.png', name: '원숭이', category: '포유류'));
    todoList.add(
        TodoList(imagePath: 'images/pig.png', name: '돼지', category: '포유류'));
    todoList.add(
        TodoList(imagePath: 'images/wolf.png', name: '늑대', category: '포유류'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListView Test'),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: todoList.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () => _showDialog(context, index),
              child: Card(
                child: SizedBox(
                  height: 100,
                  child: Row(
                    children: [
                      Image(image: AssetImage(todoList[index].imagePath)),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          todoList[index].name,
                          style: const TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  _showDialog(BuildContext context, index) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext ctx) {
        return AlertDialog(
          title: Text(todoList[index].name),
          content: Text(
              '이 동물은 ${todoList[index].category} 입니다.\n${todoList[index].category == '곤충' ? '날 수 있습니다.' : '날 수 없습니다'}'),
          actions: [
            ElevatedButton(
              onPressed: () => Navigator.of(ctx).pop(),
              child: const Text('종료'),
            )
          ],
        );
      },
    );
  }
}
