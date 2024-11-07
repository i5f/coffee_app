import 'package:flutter/material.dart';

class LocationHeader extends StatelessWidget {
  const LocationHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height/100;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: screenHeight * 4),
        const Text(
          'Location',
          style: TextStyle(color: Colors.grey, fontSize: 14, fontFamily: 'Sora'),
        ),
        const SizedBox(height: 8),
        const Text(
          'Ankara, Turkey',
          style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w300,
              fontFamily: 'Sora'),
        ),
      ],
    );
  }
}
