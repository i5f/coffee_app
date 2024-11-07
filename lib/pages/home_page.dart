import 'package:flutter/material.dart';
import 'package:coffee_app/models/coffee.dart';
import 'main_page.dart';
import 'likes_page.dart';
import 'cart_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  List<Coffee> likedCoffees = [];
  List<Coffee> cart = [];
  List<Coffee> allCoffees = [];

  @override
  void initState() {
    super.initState();
    allCoffees = [
      Coffee(
        title: 'Caffe Mocha',
        subtitle: 'Deep Foam',
        price: 5.99,
        rating: 4.8,
        imagePath: 'assets/images/mocha.jpg',
        category: 'Mocha',
      ),
      Coffee(title: 'Flat White', subtitle: 'Espresso', price: 3.99, rating: 4.5, imagePath: 'assets/images/flat_white.jpg', category: 'Latte'),
      Coffee(title: 'Cappuccino', subtitle: 'Rich & Smooth', price: 4.49, rating: 4.7, imagePath: 'assets/images/cappuccino.jpeg', category: 'Cappuccino'),
      Coffee(title: 'Espresso', subtitle: 'Strong Coffee', price: 2.99, rating: 4.6, imagePath: 'assets/images/espresso_coffee.jpg', category: 'Espresso'),
      Coffee(title: 'Americano', subtitle: 'Classic Coffee', price: 3.49, rating: 4.2, imagePath: 'assets/images/americano_coffee.jpg', category: 'Americano'),
      Coffee(title: 'Latte', subtitle: 'Mild & Creamy', price: 4.49, rating: 4.4, imagePath: 'assets/images/latte.jpg', category: 'Latte'),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _toggleLike(Coffee coffee) {
    setState(() {
      coffee.isLiked = !coffee.isLiked;
      if (coffee.isLiked) {
        if (!likedCoffees.contains(coffee)) {
          likedCoffees.add(coffee);
        }
      } else {
        likedCoffees.remove(coffee);
      }
    });
  }

  void _addToCart(Coffee coffee) {
    setState(() {
      cart.add(coffee);
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      MainPage(
        allCoffees: allCoffees,
        onLike: _toggleLike,
        onAddToCart: _addToCart,
        //onSearch: _onSearch,
      ),
      LikesPage(
        likedCoffees: likedCoffees,
        onLike: _toggleLike,
        onAddToCart: _addToCart,
      ),
      CartPage(cart: cart),
      const Center(child: Text('Notifications Page')),
    ];

    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromRGBO(250, 245, 240, 1),
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        selectedItemColor: const Color.fromRGBO(230, 130, 80, 1),
        unselectedItemColor: Colors.grey,
        selectedLabelStyle: const TextStyle(
          color: Color.fromRGBO(230, 130, 80, 1),
        ),
        unselectedLabelStyle: const TextStyle(
          color: Colors.grey,
        ),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favs'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag), label: 'Cart'),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications), label: 'Notifications'),
        ],
        onTap: _onItemTapped,
      ),
    );
  }
}
