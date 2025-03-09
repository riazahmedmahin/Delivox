import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user_app/presentation/screen/OTP_screen.dart';

import '../utility/app_color.dart';
import '../widgets/custome_bottom.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(22.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            Text("Password recovery ", style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold)),
            Text("Enter your email address to recover your password"),
            SizedBox(
              height: 50,
            ),
            TextFormField(
              decoration:  InputDecoration(
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white)),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white12),
                    borderRadius: BorderRadius.all(Radius.circular(7))),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(7)),
                  borderSide: BorderSide(
                    color: Colors.white12,
                  ), // Border when focused
                ),
                hintText: 'Email address',
                hintStyle: TextStyle(color: Colors.grey.shade400),
                prefixIcon: Icon(
                  Icons.email,
                  color: Colors.grey.shade400,
                ),
                contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16.0 * 1.5, vertical: 14.0),
              ),
              keyboardType: TextInputType.name,
              onSaved: (phone) {
                // Save it
              },
            ),
            SizedBox(
              height: 20,
            ),
            CustomButton(
                onPressed: () {
                  Get.to(OtpScreen());
                },
                text: "Next",
                color: Color(0xFF4A3298),
                txtcolor: Colors.white),
          ],
        ),
      ),
    );
  }
}
