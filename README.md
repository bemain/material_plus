Material Plus is a collection of Flutter utilities and Material-inspired widgets that help you prototype and ship polished UIs faster.

## Highlights
- Widgets: alert sheets, circular slider with theming, segmented tabs, number field, speed dial, shimmer/loading states, measure-size helper, continuous button, circular loading check.
- Utils: list/map notifiers, persisted values, process helper, duration clamp, safe casting, string casing.
- Works with Flutter apps or packages; exports live under package:material_plus/material_plus.dart.

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
