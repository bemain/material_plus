Material Plus is a collection of Flutter utilities and Material-inspired widgets.

## Highlights
- Widgets: alert sheets, circular slider, segmented tabs, number field, speed dial, shimmer/loading states.
- Utils: list/map notifiers, persisted values, process helper, string casing.

## Install
Add the package and fetch dependencies:

```sh
flutter pub add material_plus
```

## Quick start
Import and drop widgets where needed:

```dart
import 'package:flutter/material.dart';
import 'package:material_plus/material_plus.dart';

class Demo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpeedDial(
          children: const [
            SpeedDialChild(icon: Icons.add),
            SpeedDialChild(icon: Icons.edit),
          ],
        ),
      ),
    );
  }
}
```

## Docs and support
- Browse generated API docs under doc/api/material_plus.
- Run widget tests locally with flutter test.
- Issues and contributions are welcome via GitHub.
