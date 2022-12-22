import 'package:flutter/material.dart';

class WidgetDart {
  Widget portraitMode() {
    return Stack(
      children: const [
        Center(
          child: Text('Portrait Mode'),
        )
      ],
    );
  }

  Widget landscapeMode() {
    return Stack(
      children: const [
        Center(
          child: Text('Landscape Mode'),
        ),
      ],
    );
  }
}
