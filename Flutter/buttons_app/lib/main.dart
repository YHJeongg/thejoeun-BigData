import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Buttons"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                print("text button");
              },
              onLongPress: () {
                print('long text button');
              },
              style: TextButton.styleFrom(
                foregroundColor: Colors.pink,
              ),
              child: const Text(
                'Text Button',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                print('Elevated Button');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orangeAccent,
                foregroundColor: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text('Elevated Button'),
            ),
            OutlinedButton(
              onPressed: () => print('outlined button'),
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.green,
                side: const BorderSide(
                  color: Colors.black,
                  width: 2.0,
                ),
              ),
              child: const Text('Outlined Button'),
            ),
            TextButton.icon(
              onPressed: () {
                // ---
              },
              icon: const Icon(
                Icons.home,
                size: 30,
                color: Colors.black,
              ),
              label: const Text('Go to home'),
              style: TextButton.styleFrom(
                foregroundColor: Colors.purple,
              ),
            ),
            ElevatedButton.icon(
              onPressed: () {
                //---
              },
              icon: const Icon(
                Icons.home,
                color: Colors.white,
              ),
              label: const Text('Go to home'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                minimumSize: const Size(200, 50),
              ),
            ),
            OutlinedButton.icon(
              onPressed: () => print('Go to home'),
              icon: const Icon(
                Icons.home,
                color: Colors.black,
              ),
              label: const Text(
                'Go to home',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
            ButtonBar(
              alignment: MainAxisAlignment.center,
              buttonPadding: const EdgeInsets.all(20),
              children: [
                TextButton(onPressed: () {}, child: const Text('Text Button')),
                ElevatedButton(
                    onPressed: () {}, child: const Text('Elevated Button'))
              ],
            )
          ],
        ),
      ),
    );
  }
}
