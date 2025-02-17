import 'package:flutter/material.dart';

class ProductCardRight extends StatelessWidget {
  final String category;
  final String title;
  final String company;
  final double price;
  final String imageUrl;

  const ProductCardRight({
    super.key,
    required this.category,
    required this.title,
    required this.price,
    required this.company,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Color.fromRGBO(223, 229, 236, 1),
      ),
      
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded( // Makes text wrap properly within available space
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  category,
                  softWrap: true,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                SizedBox(height: 5),
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleMedium,
                  softWrap: true,
                  maxLines: 2, // Text will wrap instead of overflowing
                  overflow: TextOverflow.visible,
                ),
                SizedBox(height: 5),
                Chip(
                  label: Text(
                    company,
                    style: TextStyle(color: const Color.fromARGB(255, 22, 22, 22), fontWeight: FontWeight.bold),
                  ),
                  backgroundColor: const Color.fromARGB(255, 243, 111, 111), // Background color of the chip
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(color: Colors.black, width: 1.5), // Optional border
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  'Price : \$$price', 
                  softWrap: true,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ),
          SizedBox(width: 10), // Space between image and text
          Image(height: 170, image: AssetImage(imageUrl)),          
        ],
      ),
    );
  }
}
