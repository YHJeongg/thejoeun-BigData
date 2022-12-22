import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_route_app/home.dart';
import 'package:getx_route_app/third.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Home(),
      getPages: [
        GetPage(
          name: '/third',
          page: () => const ThirdPage(),
        ),
      ],
    );
  }
}
