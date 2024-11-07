import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  final TextEditingController controller;
  final Function(String) onChanged;

  const CustomSearchBar({
    super.key,
    required this.controller,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: const LinearGradient(colors: [
                Color.fromARGB(255, 19, 19, 19),
                Color.fromARGB(255, 34, 34, 34)
              ]),
            ),
            child: TextField(
              controller: controller,
              style: const TextStyle(
                color: Colors.white,
                fontFamily: 'Sora',
              ),
              decoration: InputDecoration(
                hintText: 'Search coffee',
                hintStyle: const TextStyle(color: Colors.grey),
                prefixIcon: const Icon(Icons.search, color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  borderSide: BorderSide.none,
                ),
              ),
              onChanged: onChanged,
            ),
          ),
        ),
        const SizedBox(width: 10),
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: const Color.fromRGBO(230, 130, 80, 1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Icon(Icons.tune, color: Colors.white),
        ),
      ],
    );
  }
}
