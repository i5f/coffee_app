import 'package:flutter/material.dart';

class PromoBanner extends StatelessWidget {
  const PromoBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: const Color.fromRGBO(165, 110, 80, 1),
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              offset: const Offset(0, 4),
              blurRadius: 10,
            ),
          ],
        ),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 210, 60, 60),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: const Text('Promo', style: TextStyle(color: Colors.white, fontSize: 12)),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Buy one,\nget one FREE',
                  style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold, fontFamily: 'Sora'),
                ),
              ],
            ),
            const Spacer(),
            Image.asset(
              'assets/images/banner.png',
              width: 80,
            ),
            const SizedBox(width: 16),
          ],
        ),
      ),
    );
  }
}
