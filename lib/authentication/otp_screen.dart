import 'package:flutter/material.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {

  TextEditingController otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('OTP Verification', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
            SizedBox(height: 30,),
            TextField(
              controller: otpController,
              keyboardType: TextInputType.phone,
              cursorColor: Colors.black,
                decoration: InputDecoration(
                  hintText: 'Enter OTP',
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
                child: Text('Verify', style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.bold),),
              )
          ],
        ),
      ),
    );
  }
}