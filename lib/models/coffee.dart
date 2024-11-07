class Coffee {
  final String title;
  final String subtitle;
  final double price;
  final double rating;
  final String imagePath;
  final String category;
  bool isLiked;

  Coffee({
    required this.title,
    required this.subtitle,
    required this.price,
    required this.rating,
    required this.imagePath,
    required this.category,
    this.isLiked = false,
  });
}
