import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Navigator_AppBar'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/sm');
            },
            icon: const Icon(Icons.email),
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/rm');
            },
            icon: const Icon(Icons.email_outlined),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: const CircleAvatar(
                backgroundImage: AssetImage('images/pikachu1.png'),
              ),
              otherAccountsPictures: const [
                CircleAvatar(
                  backgroundImage: AssetImage('images/pikachu2.png'),
                ),
                CircleAvatar(
                  backgroundImage: AssetImage('images/pikachu3.png'),
                ),
              ],
              accountName: const Text('Pikachu'),
              accountEmail: const Text('pikachu@naver.com'),
              onDetailsPressed: () {
                print('arrow is clicked');
              },
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 250, 117, 161),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.email,
                color: Colors.blueAccent,
              ),
              title: const Text('보낸 편지함'),
              onTap: () {
                Navigator.pushNamed(context, '/sm');
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.email_outlined,
                color: Colors.red,
              ),
              title: const Text('받은 편지함'),
              onTap: () {
                Navigator.pushNamed(context, '/rm');
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/sm');
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.green),
              ),
              child: const Text('보낸 편지함'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/rm');
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.red),
              ),
              child: const Text('받은 편지함'),
            ),
          ],
        ),
      ),
    );
  }
}
