import 'package:flutter/material.dart';

import 'widget.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  WidgetDart wd = WidgetDart();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Rotation Screen'),
        ),
        body: OrientationBuilder(
          builder: (context, orientation) {
            if (orientation == Orientation.portrait) {
              return wd.portraitMode();
            } else {
              return wd.landscapeMode();
            }
          },
        ));
  }

  // --- Functions ---
  // Widget portraitMode() {
  //   return Stack(
  //     children: const [
  //       Center(
  //         child: Text('Portrait Mode'),
  //       )
  //     ],
  //   );
  // }

  // Widget landscapeMode() {
  //   return Stack(
  //     children: const [
  //       Center(
  //         child: Text('Landscape Mode'),
  //       ),
  //     ],
  //   );
  // }
} // End

