import 'package:flutter/material.dart';
import 'package:shopsee/data/global_variables.dart';
import 'package:shopsee/display_style/product_card_left.dart';
import 'package:shopsee/display_style/product_card_right.dart';
import 'package:shopsee/pages/product_details_page.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  final List<String> filters = ['All', 'Electronics', 'Beauty', 'Groceries', 'Gifting'];
  String selectedFilter = 'All';
  final TextEditingController _searchController = TextEditingController();
  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    // Filter Products based on category and search query
    List<Map<String, Object>> filteredProducts = allProducts.where((prod) {
      final matchesCategory = selectedFilter == 'All' || prod['category'] == selectedFilter;
      final matchesSearch = searchQuery.isEmpty || (prod['title'] as String).toLowerCase().contains(searchQuery.toLowerCase());
      return matchesCategory && matchesSearch;
    }).toList();

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          TextField(
            controller: _searchController,
            onChanged: (value) {
              setState(() {
                searchQuery = value;
              });
            },
            cursorColor: Colors.black,
            decoration: InputDecoration(
              hintText: 'Search',
              prefixIcon: const Icon(Icons.search),
              border: const OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFF000000)),
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(color: Colors.black, width: 2.5), // No border on focus
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(color: Colors.black, width: 1.5), // Normal border
              ),
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 50,
            child: ListView.builder(
              itemCount: filters.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final filter = filters[index];
                return Padding(
                  padding: const EdgeInsets.all(5),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedFilter = filter;
                      });
                    },
                    child: Chip(
                      label: Text(filter),
                      labelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                      backgroundColor: selectedFilter == filter
                          ? Theme.of(context).colorScheme.primary
                          : const Color.fromRGBO(245, 247, 249, 1),
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(width: 1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredProducts.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                final prod = filteredProducts[index];

                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ProductDetailsPage(product: prod),
                      ),
                    );
                  },
                  child: (index % 2 == 0)
                      ? ProductCardLeft(
                          category: prod['category'] as String,
                          title: prod['title'] as String,
                          price: prod['price'] as double,
                          company: prod['company'] as String,
                          imageUrl: prod['imageUrl'] as String,
                        )
                      : ProductCardRight(
                          category: prod['category'] as String,
                          title: prod['title'] as String,
                          price: prod['price'] as double,
                          company: prod['company'] as String,
                          imageUrl: prod['imageUrl'] as String,
                        ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
