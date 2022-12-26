import 'package:flutter/material.dart';

import 'database_handler.dart';
import 'students.dart';

class UpdateStudent extends StatefulWidget {
  const UpdateStudent({
    super.key,
    required this.code,
    required this.name,
    required this.phone,
    required this.dept,
    required this.id,
  });
  final String name;
  final String code;
  final String phone;
  final String dept;
  final int id;

  @override
  State<UpdateStudent> createState() => _UpdateStudentState();
}

class _UpdateStudentState extends State<UpdateStudent> {
  late DatabaseHandler handler;
  late TextEditingController codeController;
  late TextEditingController nameController;
  late TextEditingController phoneController;
  late TextEditingController deptController;

  late String code;
  late String name;
  late String phone;
  late String dept;

  @override
  void initState() {
    super.initState();
    codeController = TextEditingController(text: widget.code);
    nameController = TextEditingController(text: widget.name);
    phoneController = TextEditingController(text: widget.phone);
    deptController = TextEditingController(text: widget.dept);
    handler = DatabaseHandler();
    handler.initializeDB();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update for CRUD'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              TextField(
                controller: codeController,
                decoration: const InputDecoration(
                  labelText: '학번을 입력하세요.',
                ),
                keyboardType: TextInputType.text,
              ),
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: '이름을 입력하세요.',
                ),
                keyboardType: TextInputType.text,
              ),
              TextField(
                controller: phoneController,
                decoration: const InputDecoration(
                  labelText: '전화번호을 입력하세요.',
                ),
                keyboardType: TextInputType.number,
              ),
              TextField(
                controller: deptController,
                decoration: const InputDecoration(
                  labelText: '전공을 입력하세요.',
                ),
                keyboardType: TextInputType.text,
              ),
              ElevatedButton(
                onPressed: () {
                  code = codeController.text;
                  name = nameController.text;
                  phone = phoneController.text;
                  dept = deptController.text;
                  updateStudents();
                },
                child: const Text('수정'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // --- Function ---
  Future<int> updateStudents() async {
    Students firstStudent = Students(
        code: code, name: name, dept: dept, phone: phone, id: widget.id);
    await handler.updateStudents(firstStudent);
    _showDialog(context);
    return 0;
  }

  _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('수정 결과'),
          content: const Text('수정이 완료 되었습니다.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.pop(context);
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
