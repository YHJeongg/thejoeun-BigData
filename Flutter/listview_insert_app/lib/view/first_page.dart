import 'package:flutter/material.dart';

import '../model/todo_list.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  late List<TodoList> todoList;

  @override
  void initState() {
    super.initState();
    todoList = [];

    todoList.add(TodoList(imagePath: 'images/cart.png', name: '책구매'));
    todoList.add(TodoList(imagePath: 'images/clock.png', name: '철수와 약속'));
    todoList.add(TodoList(imagePath: 'images/pencil.png', name: '스터디 준비하기'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Listview Test'),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: todoList.length,
          itemBuilder: (context, position) {
            return Card(
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(todoList[position].imagePath),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(todoList[position].name),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
