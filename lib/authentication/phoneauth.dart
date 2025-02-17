import 'package:flutter/material.dart';

class PhoneAuth extends StatefulWidget {
  const PhoneAuth({super.key});

  @override
  State<PhoneAuth> createState() => _PhoneAuthState();
}

class _PhoneAuthState extends State<PhoneAuth> {

  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/shopping.png'),
              Text('Verify Your Number!', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
              SizedBox(height: 40,),
              TextField(
                controller: phoneController,
                keyboardType: TextInputType.number,
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  hintText: 'Enter Phone No',
                  suffixIcon: Icon(Icons.phone),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
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
              SizedBox(height: 30,),
              ElevatedButton(
                onPressed: (){}, 
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12), // Set border radius
                    side: BorderSide(color: Colors.black, width: 2), // Border color and width
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12), // Padding
                  elevation: 5,
                ),
                child: Text('Submit', style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.bold),),
              )
            ],
          ),
        ),
      ),
    );
  }
}