import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:tabbar_ex_app/first_page.dart';
import 'package:tabbar_ex_app/second_page.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        controller: controller,
        children: const [
          FirstPage(),
          SecondPage(),
        ],
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        height: 100,
        child: TabBar(
          controller: controller,
          labelColor: Colors.blue,
          indicatorColor: Colors.red,
          tabs: const [
            Tab(
              icon: Icon(Icons.looks_one),
              text: "Pikachu Screen #1",
            ),
            Tab(
              icon: Icon(Icons.looks_two),
              text: "Pikachu Screen #2",
            )
          ],
        ),
      ),
    );
  }
}
