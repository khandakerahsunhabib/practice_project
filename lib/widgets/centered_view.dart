import 'package:flutter/material.dart';

class CenteredView extends StatelessWidget {
  const CenteredView({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      alignment: Alignment.topCenter,
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          maxWidth: 1200,
        ),
        child: child,
      ),
    );
  }
}
