import 'package:flutter/material.dart';

import 'speed_dial.dart';

class SpeedDialSpacer extends SpeedDialChild {
  /// The height of the empty space.
  final double height;

  /// A child of [SpeedDial] that adds empty space between children.
  SpeedDialSpacer({this.height = 8});

  @override
  Widget assemble(BuildContext context, Animation<double> animation) {
    return SizedBox(height: height);
  }
}
