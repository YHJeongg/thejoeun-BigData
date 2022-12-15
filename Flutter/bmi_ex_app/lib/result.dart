import 'package:bmi_ex_app/resuable_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ResultPage extends StatelessWidget {
  const ResultPage(
      {super.key,
      required this.bmiResult,
      required this.resultText,
      required this.interpretation});
  final String bmiResult;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF111328),
        title: const Text('B.M.I Calculator'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment
            .stretch, // stretch out the card widget resuable card text box
        children: [
          Expanded(
            child: Center(
                child: Text(
              'Your Result',
              style: ktitleTextStyle,
            )),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              colour: const Color(0xFF1D1E33),
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    resultText.toUpperCase(), // use from calculator brain class
                    style: kresultTextStyle,
                  ),
                  Text(
                    bmiResult, // use from calculator brain class
                    style: kBMITextStyle,
                  ),
                  Text(
                    interpretation, // use from calculator brain class
                    style: kbodyTextStyle,
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          ),

          // Second screen where result shows and re-calculate option will be there
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              // bottom box for clicking
              margin: const EdgeInsets.only(top: 10.0),
              padding: const EdgeInsets.only(bottom: 10.0),
              height: 70.0,
              // bottom box for clicking
              child: Card(
                color: Colors.pinkAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Center(
                  child: Text(
                    'Re-Calculate',
                    style: klargestButtonTextStyle,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
