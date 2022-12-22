import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_route_app/second.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GetX Route관리'),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Navigation'),
            ElevatedButton(
              onPressed: () {
                Get.to(
                  const SecondPage(),
                  arguments: ['First', 'Second'],
                  transition: Transition.zoom,
                  duration: const Duration(minutes: 1),
                );
              },
              child: const Text('화면 이동'),
            ),
            ElevatedButton(
              onPressed: () {
                Get.toNamed('/third');
              },
              child: const Text('화면 이동2'),
            ),
            ElevatedButton(
              onPressed: () async {
                var returnValue = await Get.to(
                  arguments: ['First', 'Second'],
                  const SecondPage(),
                );
                Get.snackbar(
                  'Return Value',
                  '$returnValue',
                );
              },
              child: const Text('화면 이동3'),
            ),
            const Text('SnackBar'),
            ElevatedButton(
              onPressed: () {
                Get.snackbar(
                  'Snack Bar',
                  'Message',
                  backgroundColor: Colors.amberAccent,
                  snackPosition: SnackPosition.BOTTOM,
                  duration: const Duration(seconds: 2),
                );
              },
              child: const Text('SnackBar'),
            ),
            const Text('Dialog'),
            ElevatedButton(
              onPressed: () {
                Get.defaultDialog(
                  title: 'Dialog',
                  middleText: 'Message',
                  barrierDismissible: false,
                  backgroundColor: Colors.amber,
                  actions: [
                    TextButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: const Text('Exit'),
                    ),
                  ],
                );
              },
              child: const Text('Dialog'),
            ),
            const Text('Bottom Sheet'),
            ElevatedButton(
              onPressed: () {
                Get.bottomSheet(
                  Container(
                    height: 300,
                    color: Colors.purple[200],
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text('Text Line1'),
                        Text('Text Line2'),
                      ],
                    ),
                  ),
                );
              },
              child: const Text('Bottom Sheet'),
            ),
            ElevatedButton(
              onPressed: () {
                Get.toNamed('/third?id=root&name=루트');
              },
              child: const Text('화면 이동4'),
            ),
          ],
        ),
      ),
    );
  }
}
