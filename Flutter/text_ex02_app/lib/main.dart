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
    // return Scaffold(
    //   appBar: AppBar(
    //     title: const Text("Text with Column and Row"),
    //   ),
    //   body: Center(
    //       child: Column(
    //     mainAxisAlignment: MainAxisAlignment.center,
    //     children: [
    //       Row(
    //         mainAxisAlignment: MainAxisAlignment.center,
    //         children: const [
    //           Icon(Icons.email_rounded),
    //           SizedBox(
    //             width: 10,
    //           ),
    //           Text("James")
    //         ],
    //       ),
    //       Row(
    //         mainAxisAlignment: MainAxisAlignment.center,
    //         children: const [
    //           Icon(Icons.account_balance),
    //           SizedBox(
    //             width: 10,
    //           ),
    //           Text("Cathy")
    //         ],
    //       ),
    //       Row(
    //         mainAxisAlignment: MainAxisAlignment.center,
    //         children: const [
    //           Icon(Icons.account_circle),
    //           SizedBox(
    //             width: 10,
    //           ),
    //           Text("Kenny")
    //         ],
    //       )
    //     ],
    //   )),
    // );
    return Scaffold(
      appBar: AppBar(
        title: const Text("Text with Column and Row"),
      ),
      body: Center(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.email_rounded),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.account_balance),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.account_circle),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Padding(
                padding: EdgeInsets.all(12.0),
                child: Text("James"),
              ),
              Padding(
                padding: EdgeInsets.all(12.0),
                child: Text("Cathy"),
              ),
              Padding(
                padding: EdgeInsets.all(12.0),
                child: Text("Kenny"),
              )
            ],
          ),
        ],
      )),
    );
  }
}
