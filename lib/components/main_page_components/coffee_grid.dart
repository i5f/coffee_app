import 'package:flutter/material.dart';
import 'package:coffee_app/models/coffee.dart';
import 'coffee_card.dart';

class CoffeeGrid extends StatelessWidget {
  final List<Coffee> coffees;
  final Function(Coffee) onLike;
  final Function(Coffee) onAddToCart;

  const CoffeeGrid({
    super.key,
    required this.coffees,
    required this.onLike,
    required this.onAddToCart,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: coffees.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // Adjust as needed
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 0.65, // Adjust as needed
      ),
      itemBuilder: (context, index) {
        final coffee = coffees[index];
        return CoffeeCard(
          title: coffee.title,
          subtitle: coffee.subtitle,
          price: coffee.price,
          rating: coffee.rating,
          imagePath: coffee.imagePath,
          isLiked: coffee.isLiked,
          onLike: () {
            onLike(coffee);
          },
          onAddToCart: () {
            onAddToCart(coffee);
          },
        );
        // return GestureDetector(
        //   onTap: () {
        //     // Navigate to details page if needed
        //   },
        //   child: Card(
        //     shape: RoundedRectangleBorder(
        //       borderRadius: BorderRadius.circular(15),
        //     ),
        //     child: Column(
        //       crossAxisAlignment: CrossAxisAlignment.start,
        //       children: [
        //         Stack(
        //           children: [
        //             ClipRRect(
        //               borderRadius: const BorderRadius.only(
        //                 topLeft: Radius.circular(15),
        //                 topRight: Radius.circular(15),
        //               ),
        //               child: Image.asset(
        //                 coffee.imagePath,
        //                 width: double.infinity,
        //                 height: 150,
        //                 fit: BoxFit.cover,
        //               ),
        //             ),
        //             Positioned(
        //               top: 8,
        //               right: 8,
        //               child: GestureDetector(
        //                 onTap: () {
        //                   onLike(coffee);
        //                 },
        //                 child: Container(
        //                   decoration: const BoxDecoration(
        //                     shape: BoxShape.circle,
        //                     color: Colors.white,
        //                   ),
        //                   padding: const EdgeInsets.all(4),
        //                   child: Icon(
        //                     coffee.isLiked
        //                         ? Icons.favorite
        //                         : Icons.favorite_border,
        //                     color:
        //                         coffee.isLiked ? Colors.red : Colors.grey,
        //                   ),
        //                 ),
        //               ),
        //             ),
        //           ],
        //         ),
        //         Padding(
        //           padding: const EdgeInsets.all(8.0),
        //           child: Column(
        //             crossAxisAlignment: CrossAxisAlignment.start,
        //             children: [
        //               Text(
        //                 coffee.title,
        //                 style: const TextStyle(
        //                   fontWeight: FontWeight.bold,
        //                 ),
        //               ),
        //               Text(
        //                 coffee.subtitle,
        //                 style: const TextStyle(
        //                   color: Colors.grey,
        //                 ),
        //               ),
        //               Row(
        //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //                 children: [
        //                   Text(
        //                     '\$${coffee.price.toStringAsFixed(2)}',
        //                     style: const TextStyle(
        //                       fontWeight: FontWeight.bold,
        //                     ),
        //                   ),
        //                   IconButton(
        //                     icon: Icon(
        //                       coffee.isLiked
        //                           ? Icons.favorite
        //                           : Icons.favorite_border,
        //                       color: coffee.isLiked ? Colors.red : Colors.grey,
        //                     ),
        //                     onPressed: () {
        //                       onLike(coffee);
        //                     },
        //                   ),
        //                 ],
        //               ),
        //             ],
        //           ),
        //         ),
        //       ],
        //     ),
        //   ),
        // );
      },
    );
  }
}
