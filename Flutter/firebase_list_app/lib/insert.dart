import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Insert extends StatefulWidget {
  const Insert({super.key});

  @override
  State<Insert> createState() => _InsertState();
}

class _InsertState extends State<Insert> {
  late TextEditingController codeController;
  late TextEditingController nameController;
  late TextEditingController deptController;
  late TextEditingController phoneController;

  @override
  void initState() {
    super.initState();
    codeController = TextEditingController();
    nameController = TextEditingController();
    deptController = TextEditingController();
    phoneController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Insert'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            children: [
              TextField(
                controller: codeController,
                decoration: const InputDecoration(labelText: '학번을 입력하세요.'),
                keyboardType: TextInputType.text,
              ),
              TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: '이름을 입력하세요.'),
                keyboardType: TextInputType.text,
              ),
              TextField(
                controller: deptController,
                decoration: const InputDecoration(labelText: '학과를 입력하세요.'),
                keyboardType: TextInputType.text,
              ),
              TextField(
                controller: phoneController,
                decoration: const InputDecoration(labelText: '전화번호를 입력하세요.'),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(
                height: 50,
              ),
              ElevatedButton(
                onPressed: () {
                  String code = codeController.text;
                  String name = nameController.text;
                  String dept = deptController.text;
                  String phone = phoneController.text;
                  addAction(code, name, dept, phone);
                },
                child: const Text('입력'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // --- Functions ---
  addAction(String code, String name, String dept, String phone) {
    FirebaseFirestore.instance
        .collection('students')
        .add({'code': code, 'name': name, 'dept': dept, 'phone': phone});
    _showDialog(context);
  }

  _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('입력 결과'),
          content: const Text('입력이 완료 되었습니다.'),
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
} // End
