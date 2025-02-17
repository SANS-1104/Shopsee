import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopsee/providers/cart_provider.dart';
import 'package:shopsee/pages/home_page.dart';

class ProductDetailsPage extends StatefulWidget {
  final Map<String,Object> product;
  const ProductDetailsPage({super.key, required this.product});

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {

  void onTap(){
    Provider.of<CartProvider>(context, listen: false).addProduct(
      {
        'id': widget.product['id'],
        'title': widget.product['title'],
        'category': widget.product['category'],
        'company': widget.product['company'],
        'price': widget.product['price'],
        'imageUrl': widget.product['imageUrl']
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details',style: TextStyle(fontWeight: FontWeight.w500, fontSize: 24),), 
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          },
          icon: Icon(Icons.arrow_back_rounded, size: 28,)
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            Center(child: Text(widget.product['category'] as String, style: TextStyle(fontSize: 26),),),
            SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Chip(
                  label: Text(
                    widget.product['title'] as String,
                    style: TextStyle(color: const Color.fromARGB(255, 22, 22, 22), fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  backgroundColor: const Color.fromARGB(255, 243, 111, 111), // Background color of the chip
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    // side: BorderSide(color: Colors.black, width: 1), // Optional border
                  ),
              ),
              Chip(
                  label: Text(
                    widget.product['company'] as String,
                    style: TextStyle(color: const Color.fromARGB(255, 22, 22, 22), fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  backgroundColor: const Color.fromARGB(255, 243, 111, 111), // Background color of the chip
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    // side: BorderSide(color: Colors.black, width: 1), // Optional border
                  ),
              ),
                
            ],),
            Image.asset(widget.product['imageUrl'] as String,height: 400,),
            Spacer(),
            Container(
              // height: 100,
              decoration: BoxDecoration(
                color: Color.fromRGBO(231, 232, 233, 1),
                borderRadius: BorderRadius.all(Radius.circular(20))
              ),
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Center(
                  child: Column(
                    children: [
                      Text('\$${widget.product['price'] as double}', style: TextStyle(fontSize: 26),),
                      SizedBox(height: 10,),
                      ElevatedButton.icon(
                        onPressed: onTap,
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Color.fromARGB(255, 48, 48, 48),
                          backgroundColor: Color.fromRGBO(240, 219, 135, 1),
                          textStyle: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
                          side: BorderSide(width: 0.5),
                          minimumSize: Size(double.infinity, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10), 
                          ),
                        ),
                        icon: Icon(Icons.shopping_cart, size: 26, color: Color.fromARGB(255, 48, 48, 48)),
                        label: Text(
                          'Add to Cart',                           
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}