import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopsee/pages/cart_page.dart';
import 'package:shopsee/pages/product_list.dart';



class HomePage extends StatefulWidget{
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currPage = 0;

  List<Widget> pages = [ProductList(),CartPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, 
        title: Text(
          'Shopsee', 
          style: GoogleFonts.lato(textStyle: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
        ),
        centerTitle: true,
      ),
      body: IndexedStack(
        index: currPage,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 0,
        unselectedFontSize: 0,
        iconSize: 35,
        onTap: (value) {
          setState(() {
            currPage = value;
          });
        },
        currentIndex: currPage,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_bag), label: ''),
          
        ]
      ),
    );
  }
}