import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  const Background({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 2,
          child: Container(
            color: const Color.fromARGB(255, 19, 19, 19),
          ),
        ),
        Expanded(
          flex: 3,
          child: Container(
            color: const Color.fromRGBO(250, 245, 240, 1),
          ),
        ),
      ],
    );
  }
}
