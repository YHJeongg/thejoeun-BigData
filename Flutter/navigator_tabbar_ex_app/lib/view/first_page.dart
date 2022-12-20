import 'package:flutter/material.dart';

import '../model/message.dart';
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

    todoList = Message.todoList;
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
            return Card(
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
            );
          },
        ),
      ),
    );
  }
}
