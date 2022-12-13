import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Drawer'),
        actions: [
          IconButton(
            onPressed: () {
              print('Shopping cart');
            },
            icon: const Icon(
              Icons.shopping_cart,
            ),
          ),
          IconButton(
            onPressed: () {
              print('Search is clicked');
            },
            icon: const Icon(
              Icons.search,
            ),
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('images/pikachu1.png'),
              ),
              otherAccountsPictures: [
                CircleAvatar(
                  backgroundImage: AssetImage('images/pikachu2.png'),
                ),
                CircleAvatar(
                  backgroundImage: AssetImage('images/pikachu3.png'),
                ),
              ],
              accountName: Text('Pikachu'),
              accountEmail: Text('pikachu@naver.com'),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 250, 117, 161),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.home,
                color: Colors.black,
              ),
              title: const Text('Home'),
              onTap: () {
                print("home is clicked");
              },
              trailing: const Icon(
                Icons.add,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
