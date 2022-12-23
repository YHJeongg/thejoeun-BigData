import 'dart:convert';

import 'package:crud_app/delete_student.dart';
import 'package:crud_app/update_student.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'insert_student.dart';

class SelectAll extends StatefulWidget {
  const SelectAll({super.key});

  @override
  State<SelectAll> createState() => _SelectAllState();
}

class _SelectAllState extends State<SelectAll> {
  late List data;

  @override
  void initState() {
    super.initState();
    data = [];
    getJsonData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CRUD for Students'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const InsertStudent();
                  },
                ),
              ).then((value) => getJsonData());
            },
            icon: const Icon(Icons.add_outlined),
          ),
        ],
      ),
      body: Center(
        child: data.isEmpty
            ? const Text('데이터가 없습니다.')
            : ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onLongPress: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return DeleteStudent(
                                code: data[index]['code'],
                                name: data[index]['name'],
                                phone: data[index]['phone'],
                                dept: data[index]['dept'],
                              );
                            },
                          ),
                        ).then((value) => getJsonData());
                      },
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return UpdateStudent(
                                code: data[index]['code'],
                                name: data[index]['name'],
                                phone: data[index]['phone'],
                                dept: data[index]['dept'],
                              );
                            },
                          ),
                        ).then((value) => getJsonData());
                      },
                      child: Card(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                const Text('Code : '),
                                Text(data[index]['code']),
                              ],
                            ),
                            Row(
                              children: [
                                const Text('Name : '),
                                Text(data[index]['name']),
                              ],
                            ),
                            Row(
                              children: [
                                const Text('Phone : '),
                                Text(data[index]['phone']),
                              ],
                            ),
                            Row(
                              children: [
                                const Text('Dept : '),
                                Text(data[index]['dept']),
                              ],
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

  // --- Functions ---
  Future<bool> getJsonData() async {
    var url =
        Uri.parse('http://localhost:8080/Flutter/student_query_flutter.jsp');
    var response = await http.get(url);
    data.clear();
    var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));
    List result = dataConvertedJSON['results'];
    setState(() {
      data.addAll(result);
    });
    return true;
  }
} // End
