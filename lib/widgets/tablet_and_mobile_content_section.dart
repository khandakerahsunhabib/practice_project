import 'package:flutter/material.dart';

class TabletAndMobileContentSection extends StatelessWidget {
  const TabletAndMobileContentSection({
    super.key,
    required this.heading,
    required this.description,
  });

  final String heading;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          heading,
          style: const TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.w900,
            height: 1,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          description,
          style: const TextStyle(
            fontSize: 18,
            height: 1.9,
            letterSpacing: 0.5,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 30,
        ),
        SizedBox(
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(10),
            width: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.teal.shade500,
            ),
            child: const Text(
              'Join Course',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
