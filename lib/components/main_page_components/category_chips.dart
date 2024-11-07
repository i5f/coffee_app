// components/main_page_components/category_chips.dart

import 'package:flutter/material.dart';

class CategoryChips extends StatelessWidget {
  final String selectedFilter;
  final Function(String) onSelected;

  const CategoryChips({
    super.key,
    required this.selectedFilter,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    final List<String> categories = [
      'All Coffee',
      'Espresso',
      'Latte',
      'Cappuccino',
      'Mocha',
      'Americano',
    ];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: categories.map((category) {
          final bool isSelected = selectedFilter == category;
          return Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: ChoiceChip(
              label: Text(category),
              selected: isSelected,
              onSelected: (selected) {
                onSelected(category);
              },
              selectedColor: const Color.fromRGBO(230, 130, 80, 1),
              backgroundColor: Colors.grey[200],
              labelStyle: TextStyle(
                color: isSelected ? Colors.white : Colors.black,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
