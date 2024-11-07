import 'package:coffee_app/models/coffee.dart';
import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  final List<Coffee> cart;
  const CartPage({super.key, required this.cart});

  @override
  // ignore: library_private_types_in_public_api
  _CartPageState createState() => _CartPageState();
}


class _CartPageState extends State<CartPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(250, 245, 240, 1),
      appBar: AppBar(
        title: const Text('Order'),
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(250, 245, 240, 1),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Order Type Selection
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ChoiceChip(
                  label: const Text('Deliver'),
                  selected: true,
                  selectedColor: const Color.fromRGBO(165, 110, 80, 1),
                  onSelected: (selected) {},
                ),
                const SizedBox(width: 10),
                ChoiceChip(
                  label: const Text('Pick Up'),
                  selected: false,
                  selectedColor: const Color.fromRGBO(165, 110, 80, 1),
                  onSelected: (selected) {},
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Delivery Address Section
            const Text(
              'Delivery Address',
              style: TextStyle(fontWeight: FontWeight.w800, fontSize: 16),
            ),
            const SizedBox(height: 12),
            const Text(
              'Çankaya/Ankara',
              style: TextStyle(color: Color.fromARGB(255, 0, 0, 0),fontWeight: FontWeight.w600,),
            ),
            const SizedBox(height: 6),
            const Text(
              'Üniversiteler Mah. Dumlupınar Blv. No:1',
              style: TextStyle(color: Color.fromARGB(255, 106, 106, 106)),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                OutlinedButton.icon(
                  icon: const Icon(Icons.edit_location_alt_outlined, size: 18),
                  label: const Text('Edit Address', style: TextStyle(fontSize: 14, fontFamily: 'Sora')),
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    foregroundColor: const Color.fromARGB(255, 0, 0, 0),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  ),
                ),
                const SizedBox(width: 10),
                OutlinedButton.icon(
                  icon: const Icon(Icons.add, size: 18),
                  label: const Text('Add Note', style: TextStyle(fontSize: 14, fontFamily: 'Sora')),
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.black,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Order Item
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    'assets/images/mocha.jpg',
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 10),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Caffe Mocha',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      Text(
                        'Deep Foam',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.remove_circle_outline),
                      onPressed: () {},
                    ),
                    const Text('1'),
                    IconButton(
                      icon: const Icon(Icons.add_circle_outline),
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Discount Info
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: const Row(
                children: [
                  Icon(Icons.local_offer, color: Colors.orange),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      '1 Discount is Applied',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(
                    '\$1.00',
                    style: TextStyle(
                      color: Colors.orange,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const Divider(),

            // Payment Summary
            const Text(
              'Payment Summary',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 10),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Price'),
                Text(
                  '\$4.53',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 5),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Delivery Fee'),
                Text(
                  '\$1.00',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const Spacer(),

            // Place Order Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(230, 130, 80, 1),
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'Place Order',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


// return Scaffold(
//   backgroundColor: const Color.fromRGBO(250, 245, 240, 1),
//   appBar: AppBar(
//     backgroundColor: const Color.fromRGBO(250, 245, 240, 1),
//     title: const Text(
//       'Order',
//       style: TextStyle(fontFamily: 'Sora', fontWeight: FontWeight.bold),
//     ),
//   ),
//   body: cart.isEmpty
//       ? const Center(
//           child: Text(
//             'Your cart is empty.',
//             style: TextStyle(fontFamily: 'Sora'),
//           ),
//         )
//       : ListView.builder(
//           itemCount: cart.length,
//           itemBuilder: (context, index) {
//             final coffee = cart[index];
//             return ListTile(
//               leading: Image.asset(coffee.imagePath, width: 50, height: 50),
//               title:
//                   Text(coffee.title, style: TextStyle(fontFamily: 'Sora')),
//               subtitle: Text('\$${coffee.price.toStringAsFixed(2)}',
//                   style: TextStyle(fontFamily: 'Sora')),
//             );
//           },
//         ),