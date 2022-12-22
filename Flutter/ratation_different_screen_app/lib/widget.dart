import 'package:flutter/material.dart';

class WidgetDart {
  Widget portraitMode() {
    return Stack(
      children: [
        Center(
          child: ElevatedButton(
            onPressed: () {
              //
            },
            child: const Text('Hello'),
          ),
        )
      ],
    );
  }

  Widget landscapeMode() {
    return Stack(
      children: [
        Center(
          child: ElevatedButton(
            onPressed: () {
              //
            },
            child: const Text('Flutter'),
          ),
        ),
      ],
    );
  }
}
