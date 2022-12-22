import 'package:collection_view_label_app/detail_page.dart';
import 'package:collection_view_label_app/insert_page.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List<String> heroList = [];

  @override
  void initState() {
    super.initState();
    heroList.add('유비');
    heroList.add('관우');
    heroList.add('장비');
    heroList.add('조조');
    heroList.add('여포');
    heroList.add('초선');
    heroList.add('손견');
    heroList.add('장양');
    heroList.add('장양');
    heroList.add('손책');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('삼국지 인물'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const InsertPage();
                  },
                ),
              ).then(
                (value) {
                  setState(() {
                    heroList.add(value);
                  });
                },
              );
            },
            icon: const Icon(Icons.add_outlined),
          ),
        ],
      ),
      body: GridView.builder(
        itemCount: heroList.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              color: Colors.grey,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return DetailPage(heroName: heroList[index]);
                      },
                    ),
                  );
                },
                child: Card(
                  color: Colors.yellow,
                  child: Center(
                    child: Text(heroList[index]),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
