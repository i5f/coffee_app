import 'package:flutter/material.dart';

class AnimatedAddToCartButton extends StatefulWidget {
  final VoidCallback onAddToCart;

  const AnimatedAddToCartButton({super.key, required this.onAddToCart});

  @override
  // ignore: library_private_types_in_public_api
  _AnimatedAddToCartButtonState createState() => _AnimatedAddToCartButtonState();
}

class _AnimatedAddToCartButtonState extends State<AnimatedAddToCartButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 150),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.9).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );
    _colorAnimation = ColorTween(
      begin: const Color.fromRGBO(230, 130, 80, 1),
      end: Colors.orangeAccent,
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _animateButton() {
    _controller.forward().then((_) => _controller.reverse());
    widget.onAddToCart();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _animateButton,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: AnimatedBuilder(
          animation: _colorAnimation,
          builder: (context, child) {
            return Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: _colorAnimation.value,
                borderRadius: BorderRadius.circular(5),
              ),
              child: const Icon(Icons.add, color: Colors.white, size: 18),
            );
          },
        ),
      ),
    );
  }
}
