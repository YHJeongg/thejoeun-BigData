import 'package:flutter/material.dart';

import 'first_page.dart';
import 'second_page.dart';

class TabbarController extends StatefulWidget {
  const TabbarController({super.key});

  @override
  State<TabbarController> createState() => _TabbarControllerState();
}

class _TabbarControllerState extends State<TabbarController>
    with SingleTickerProviderStateMixin {
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
      bottomNavigationBar: SizedBox(
        height: 50,
        child: TabBar(
          controller: controller,
          labelColor: Colors.blue,
          indicatorColor: Colors.red,
          tabs: const [
            Tab(
              icon: Icon(Icons.looks_one),
            ),
            Tab(
              icon: Icon(Icons.looks_two),
            )
          ],
        ),
      ),
    );
  }
}
