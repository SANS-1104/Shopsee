import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopsee/providers/cart_provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context).cart;
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                Text('Cart', style: TextStyle(fontSize: 30),),
                SizedBox(width: 10,),
                Icon(Icons.shopping_cart_outlined, size: 35,)
              ],
            ),
          ),
          SizedBox(height: 10,),
          Expanded(
            child: ListView.builder(
              itemCount: cart.length,
              itemBuilder: (context,index){
                final cartItem = cart[index];
                return Container(
                   decoration: BoxDecoration(
                    color: index % 2 == 0
                        ? Color.fromARGB(255, 248, 173, 173) // Background for even indices
                        : Colors.transparent, // Default background for odd indices
                    borderRadius: BorderRadius.circular(10), // Rounded corners
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage(cartItem['imageUrl'].toString()),
                      radius: 25,
                    ),
                    title: Text(cartItem['title'].toString(), style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),),
                    subtitle: Text(cartItem['company'].toString(), style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),),
                    trailing: IconButton(
                      onPressed: (){
                        showDialog(barrierDismissible: false,context: context, builder: (context){
                          return AlertDialog(
                            
                            title: Text('Delete Product', style: TextStyle(color: Color.fromRGBO(92, 0, 0, 1), fontSize: 20, fontWeight: FontWeight.bold) ),
                            content: Text('Are you Sure you want to delete this Product?', style: TextStyle(fontSize: 16,fontWeight: FontWeight.normal )),
                            actions: [
                              TextButton(
                                onPressed: (){
                                  Provider.of<CartProvider>(context, listen: false).removeProduct(cartItem);
                                  Navigator.of(context).pop();
                                }, 
                                child: Text('Yes', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black),)
                              ),
                              TextButton(
                                onPressed: (){
                                  Navigator.of(context).pop();
                                }, 
                                child: Text('No', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black), )
                              ),
                            ],
                          );
                        });
                      }, 
                      icon: Icon(Icons.delete, color: Color.fromRGBO(92, 0, 0, 1),size: 30,)
                    ),
                  ),
                );
              }
            ),
          )
        ],
      ),
    );
  }
}