import 'package:bmi_ex_app/calc.dart';
import 'package:bmi_ex_app/resuable_card.dart';
import 'package:bmi_ex_app/result.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'icon_content.dart';

enum GenderType {
  male,
  female,
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Color maleCardColour = const Color(0xFF1D1E33);
  Color femaleCardColour = const Color(0xFF1D1E33);
  late int height;
  late int weight;
  late int age;

  @override
  void initState() {
    super.initState();
    height = 180;
    weight = 60;
    age = 18;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 58, 38, 92),
        appBar: AppBar(
          title: const Text('BMI 계산기'),
          centerTitle: true,
          backgroundColor: Colors.pinkAccent,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              // Height
              ReusableCard(
                colour: Colors.deepPurpleAccent,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      'HEIGHT',
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.white,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(
                          height.toString(),
                          style: const TextStyle(
                            fontSize: 50.0,
                            fontWeight: FontWeight.w900,
                            color: Colors.white,
                          ),
                        ),
                        const Text(
                          'cm',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w900,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),

                    // SLIDER
                    SliderTheme(
                      data: const SliderThemeData(
                        inactiveTrackColor: Colors.grey,
                        activeTrackColor: Colors.white,
                        thumbColor: Colors.pinkAccent,
                        overlayColor: Colors.black54,
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15.0),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 30.0),
                      ),
                      child: Slider(
                        value: height.toDouble(),
                        min: 120,
                        max: 220,
                        onChanged: (double newValue) {
                          setState(
                            () {
                              height = newValue.round();
                            },
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
              // Weight
              Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                      colour: Colors.deepPurpleAccent,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'WEIGHT',
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.white,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                weight.toString(),
                                style: const TextStyle(
                                  fontSize: 50.0,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.white,
                                ),
                              ),
                              const Text(
                                'kg',
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(
                                onPressed: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                                backgroundColor: Colors.black54,
                                child: const Icon(
                                  Icons.remove,
                                  color: Colors.white,
                                  size: 35.0,
                                ),
                              ),
                              const SizedBox(
                                width: 10.0,
                              ),
                              FloatingActionButton(
                                onPressed: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                                backgroundColor: Colors.black54,
                                child: const Icon(
                                  Icons.add,
                                  color: Colors.white,
                                  size: 35.0,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              // Age
              Row(
                children: [
                  Expanded(
                    child: Row(
                      children: <Widget>[
                        //MALE
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                updateColour(GenderType.male);
                              });
                            },
                            child: ReusableCard(
                              colour: maleCardColour,
                              cardChild: const IconContent(
                                icon: FontAwesomeIcons.mars,
                                label: 'MALE',
                              ),
                            ),
                          ),
                        ),

                        //FEMALE
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                updateColour(GenderType.female);
                              });
                            },
                            child: ReusableCard(
                              colour: femaleCardColour,
                              cardChild: const IconContent(
                                icon: FontAwesomeIcons.venus,
                                label: 'FEMALE',
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      colour: Colors.deepPurpleAccent,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'AGE',
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            age.toString(),
                            style: const TextStyle(
                              fontSize: 50.0,
                              fontWeight: FontWeight.w900,
                              color: Colors.white,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(
                                onPressed: () {
                                  setState(() {
                                    age--;
                                  });
                                },
                                backgroundColor: Colors.black54,
                                child: const Icon(
                                  Icons.remove,
                                  color: Colors.white,
                                  size: 35.0,
                                ),
                              ),
                              const SizedBox(
                                width: 10.0,
                              ),
                              FloatingActionButton(
                                onPressed: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                                backgroundColor: Colors.black54,
                                child: const Icon(
                                  Icons.add,
                                  color: Colors.white,
                                  size: 35.0,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {
                  Calculator calc = Calculator(height: height, weight: weight);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return ResultPage(
                          bmiResult: calc.calculateBMI(),
                          resultText: calc.getResult(),
                          interpretation: calc.getInterpretation(),
                        );
                      },
                    ),
                  );
                },
                child: Container(
                  margin: const EdgeInsets.only(top: 10.0),
                  padding: const EdgeInsets.only(bottom: 10.0),
                  height: 70.0,
                  child: Card(
                    color: Colors.pinkAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: const Center(
                      child: Text(
                        'BMI 계산하기',
                        style: TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void updateColour(GenderType gender) {
    if (gender == GenderType.male) {
      if (maleCardColour == const Color(0xFF1D1E33)) {
        maleCardColour = Colors.deepPurple;
        femaleCardColour = const Color(0xFF1D1E33);
      } else {
        maleCardColour = Colors.deepPurple;
      }
    }

    if (gender == GenderType.female) {
      if (femaleCardColour == const Color(0xFF1D1E33)) {
        femaleCardColour = Colors.deepPurple;
        maleCardColour = const Color(0xFF1D1E33);
      } else {
        femaleCardColour = Colors.deepPurple;
      }
    }
  }
}
