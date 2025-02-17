import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopsee/pages/home_page.dart';
import 'package:shopsee/providers/cart_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: MaterialApp(
        title: 'Shopsee',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Color.fromRGBO(139, 114, 3, 1), primary: Color.fromRGBO(254,206,1,1)),
          inputDecorationTheme: InputDecorationTheme(
            hintStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16
            ),
            prefixIconColor: Color.fromRGBO(119,119,119,1)
          ),
          textTheme: TextTheme(
            titleMedium: TextStyle(fontWeight: FontWeight.bold,fontSize: 22),
            titleSmall: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
            bodyMedium: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)
          )
        ),
        home: HomePage(),
      ),
    );
  }
}

