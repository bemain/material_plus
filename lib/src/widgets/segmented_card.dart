import 'package:flutter/material.dart';

class SegmentedCard extends StatelessWidget {
  /// A widget that groups its [children] together, but still leaves a clear
  /// border between them.
  ///
  /// This widget is inspired by Android's settings menu, and is often used
  /// with [ListTile]s as [children].
  const SegmentedCard({
    super.key,
    required this.children,
    this.elevation,
    this.outerRadius = const Radius.circular(24),
    this.innerRadius = const Radius.circular(4),
    this.spacing = 2.0,
    this.clipBehavior,
  });

  /// The widgets below this widget in the tree.
  final List<Widget> children;

  /// Defines the card's [Material.elevation].
  ///
  /// See [Card.elevation].
  final double? elevation;

  /// The radius used on the outsides of the card.
  final Radius outerRadius;

  /// The radius used for the border between the [children].
  final Radius innerRadius;

  /// How much space to place between children in the main axis.
  final double spacing;

  /// The content will be clipped (or not) according to this option.
  ///
  /// See [Card.clipBehavior].
  final Clip? clipBehavior;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(4.0),
      child: Column(
        spacing: spacing,
        children: [
          for (final (int index, Widget child) in children.indexed)
            Card(
              clipBehavior: clipBehavior,
              margin: EdgeInsets.zero,
              elevation: elevation,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  top: index == 0 ? outerRadius : innerRadius,
                  bottom: index == children.length - 1
                      ? outerRadius
                      : innerRadius,
                ),
              ),
              child: child,
            ),
        ],
      ),
    );
  }
}
