import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late TextEditingController sepalLengthController;
  late TextEditingController sepalWidthController;
  late TextEditingController petalLengthController;
  late TextEditingController petalWidthController;

  late String sepalLength;
  late String sepalWidth;
  late String petalLength;
  late String petalWidth;

  late String imageName;
  String result = 'all';

  @override
  void initState() {
    super.initState();
    sepalLengthController = TextEditingController();
    sepalWidthController = TextEditingController();
    petalLengthController = TextEditingController();
    petalWidthController = TextEditingController();
  }

  Widget wtextField(String lText, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(labelText: lText),
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('IRIS 품종예측'),
        ),
        body: Center(
          child: Column(
            children: [
              wtextField('Sepal Length', sepalLengthController),
              wtextField('Sepal Width', sepalWidthController),
              wtextField('Petal Length', petalLengthController),
              wtextField('Petal Width', petalWidthController),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  sepalWidth = sepalWidthController.text;
                  sepalLength = sepalLengthController.text;
                  petalWidth = petalWidthController.text;
                  petalLength = petalLengthController.text;
                  getJSONData();
                },
                child: const Text('입력'),
              ),
              const SizedBox(height: 50),
              CircleAvatar(
                radius: 100,
                backgroundImage: AssetImage('images/$result.jpg'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // --- Funtions ---
  getJSONData() async {
    var url = Uri.parse(
        'http://localhost:8080/Rserve/response_iris.jsp?sepalLength=$sepalLength&sepalWidth=$sepalWidth&petalLength=$petalLength&petalWidth=$petalWidth');
    var response = await http.get(url);
    setState(() {
      var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));
      result = dataConvertedJSON['result'];
    });

    _showDialog(context, result);
  }

  _showDialog(BuildContext context, String result) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('품종 예측 결과'),
          content: Text('입력하신 품종은 $result 입니다.'),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  imageName = result;
                });
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
} // End
