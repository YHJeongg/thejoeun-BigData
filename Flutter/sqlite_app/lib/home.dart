import 'package:flutter/material.dart';
import 'package:sqlite_app/database_handler.dart';
import 'package:sqlite_app/students.dart';
import 'package:sqlite_app/update_student.dart';

import 'insert_student.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late DatabaseHandler handler;

  @override
  void initState() {
    super.initState();
    handler = DatabaseHandler();
    handler.initializeDB().whenComplete(
      () async {
        // await addStudents();
        setState(() {});
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SQLite for Students'),
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
              ).then(
                (value) {
                  setState(() {
                    handler.queryStudents();
                  });
                },
              );
            },
            icon: const Icon(Icons.add_outlined),
          ),
        ],
      ),
      body: FutureBuilder(
        future: handler.queryStudents(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (context, index) {
                return Dismissible(
                  direction: DismissDirection.endToStart,
                  key: UniqueKey(),
                  onDismissed: (direction) {
                    handler.deleteStudents(snapshot.data![index].id!);
                  },
                  background: Container(color: Colors.red),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return UpdateStudent(
                              code: snapshot.data![index].code,
                              name: snapshot.data![index].name,
                              phone: snapshot.data![index].phone,
                              dept: snapshot.data![index].dept,
                              id: snapshot.data![index].id!,
                            );
                          },
                        ),
                      ).then(
                        (value) {
                          setState(() {
                            handler.queryStudents();
                          });
                        },
                      );
                    },
                    child: Card(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text('Code : ${snapshot.data![index].code}'),
                            ],
                          ),
                          Row(
                            children: [
                              Text('Name : ${snapshot.data![index].name}'),
                            ],
                          ),
                          Row(
                            children: [
                              Text('Dept : ${snapshot.data![index].dept}'),
                            ],
                          ),
                          Row(
                            children: [
                              Text('Phone : ${snapshot.data![index].phone}'),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  // ---Functions---

  // Test용 임시 DATA 생성하기
  Future<int> addStudents() async {
    Students firstStudent =
        Students(code: '1111', name: '유비', dept: '컴퓨터공학과', phone: '1111');
    await handler.insertStudents(firstStudent);

    Students secondStudent =
        Students(code: '2222', name: '관우', dept: '심리학과', phone: '2222');
    await handler.insertStudents(secondStudent);

    Students thirdStudent =
        Students(code: '3333', name: '장비', dept: '시각디자인학과', phone: '3333');
    await handler.insertStudents(thirdStudent);
    return 0;
  }
} // End
