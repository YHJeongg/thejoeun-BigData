import 'package:flutter/material.dart';

import 'first_page.dart';

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
    controller = TabController(length: 3, vsync: this);
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
          FirstPage(site: 1),
          FirstPage(site: 2),
          FirstPage(site: 3),
        ],
      ),
      bottomNavigationBar: SizedBox(
        height: 150,
        child: TabBar(
          controller: controller,
          labelColor: Colors.blue,
          indicatorColor: Colors.red,
          tabs: [
            Tab(
              icon: Image.asset(
                'images/naver.png',
                width: 40,
                height: 40,
              ),
              text: "네이버",
            ),
            Tab(
              icon: Image.asset(
                'images/google.png',
                width: 40,
                height: 40,
              ),
              text: "구글",
            ),
            Tab(
              icon: Image.asset(
                'images/daum.png',
                width: 40,
                height: 40,
              ),
              text: "다음",
            ),
          ],
        ),
      ),
    );
  }
}
