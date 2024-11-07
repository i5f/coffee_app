import 'package:flutter/material.dart';
import 'package:coffee_app/components/main_page_components/background.dart';
import 'package:coffee_app/components/main_page_components/location_header.dart';
import 'package:coffee_app/components/main_page_components/custom_search_bar.dart';
import 'package:coffee_app/components/main_page_components/category_chips.dart';
import 'package:coffee_app/components/main_page_components/promo_banner.dart';
import 'package:coffee_app/components/main_page_components/coffee_grid.dart';
import 'package:coffee_app/models/coffee.dart';

class MainPage extends StatefulWidget {
  final List<Coffee> allCoffees;
  final Function(Coffee) onLike;
  //final Function(String) onSearch;
  final Function(Coffee) onAddToCart;

  const MainPage({
    super.key,
    required this.allCoffees,
    required this.onLike,
    required this.onAddToCart,
    //required this.onSearch,
  });

  @override
  // ignore: library_private_types_in_public_api
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  String selectedFilter = 'All Coffee';
  List<Coffee> displayedCoffees = [];
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    displayedCoffees = widget.allCoffees;
  }

  void _filterCoffees() {
    setState(() {
      if (selectedFilter == 'All Coffee') {
        displayedCoffees = widget.allCoffees;
      } else {
        displayedCoffees = widget.allCoffees.where((coffee) {
          return coffee.category == selectedFilter;
        }).toList();
      }
    });
  }

  void _onCategorySelected(String category) {
    setState(() {
      selectedFilter = category;
      _filterCoffees();
    });
  }

  void _performSearch(String query) {
    //widget.onSearch(query);
    setState(() {
      displayedCoffees = widget.allCoffees.where((coffee) {
        final matchesQuery = coffee.title.toLowerCase().contains(query.toLowerCase()) ||
            coffee.subtitle.toLowerCase().contains(query.toLowerCase());
        final matchesCategory = selectedFilter == 'All Coffee' || coffee.category == selectedFilter;
        return matchesQuery && matchesCategory;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Background(),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            children: [
              const LocationHeader(),
              const SizedBox(height: 24),
              CustomSearchBar(
                controller: _searchController,
                onChanged: _performSearch,
              ),
              const SizedBox(height: 24),
              const PromoBanner(),
              const SizedBox(height: 20),
              CategoryChips(
                selectedFilter: selectedFilter,
                onSelected: _onCategorySelected,
              ),
              const SizedBox(height: 20),
              CoffeeGrid(
                coffees: displayedCoffees,
                onLike: widget.onLike,
                onAddToCart: widget.onAddToCart,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
