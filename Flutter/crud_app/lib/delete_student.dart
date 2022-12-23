import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DeleteStudent extends StatefulWidget {
  const DeleteStudent({
    super.key,
    required this.code,
    required this.name,
    required this.phone,
    required this.dept,
  });
  final String name;
  final String code;
  final String phone;
  final String dept;

  @override
  State<DeleteStudent> createState() => _DeleteStudentState();
}

class _DeleteStudentState extends State<DeleteStudent> {
  late TextEditingController codeController;
  late TextEditingController nameController;
  late TextEditingController phoneController;
  late TextEditingController deptController;

  late String code;

  @override
  void initState() {
    super.initState();
    codeController = TextEditingController(text: widget.code);
    nameController = TextEditingController(text: widget.name);
    phoneController = TextEditingController(text: widget.phone);
    deptController = TextEditingController(text: widget.dept);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Delete for CRUD'),
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
                readOnly: true,
              ),
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: '이름을 입력하세요.',
                ),
                keyboardType: TextInputType.text,
                readOnly: true,
              ),
              TextField(
                controller: phoneController,
                decoration: const InputDecoration(
                  labelText: '전화번호을 입력하세요.',
                ),
                keyboardType: TextInputType.number,
                readOnly: true,
              ),
              TextField(
                controller: deptController,
                decoration: const InputDecoration(
                  labelText: '전공을 입력하세요.',
                ),
                keyboardType: TextInputType.text,
                readOnly: true,
              ),
              ElevatedButton(
                onPressed: () {
                  code = codeController.text;
                  getJSONData();
                },
                child: const Text('삭제'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // --- Function ---
  getJSONData() async {
    var url = Uri.parse(
        'http://localhost:8080/Flutter/student_delete_flutter.jsp?code=$code');
    await http.get(url);
    _showDialog(context);
  }

  _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('삭제 결과'),
          content: const Text('삭제가 완료 되었습니다.'),
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
