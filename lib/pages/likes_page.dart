import 'package:flutter/material.dart';
import 'package:coffee_app/models/coffee.dart';
import 'package:coffee_app/components/main_page_components/coffee_grid.dart';

class LikesPage extends StatelessWidget {
  final List<Coffee> likedCoffees;
  final Function(Coffee) onLike;
  final Function(Coffee) onAddToCart;

  const LikesPage({
    super.key,
    required this.likedCoffees,
    required this.onLike,
    required this.onAddToCart,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(250, 245, 240, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(250, 245, 240, 1),
        title: const Text('Liked Coffees'),
      ),
      body: likedCoffees.isEmpty
          ? const Center(
              child: Text('No liked coffees yet.'),
            )
          : Padding(
            padding: const EdgeInsets.all(8.0),
            child: CoffeeGrid(
                coffees: likedCoffees,
                onLike: onLike,
                onAddToCart: onAddToCart,
              ),
          ),
    );
  }
}
