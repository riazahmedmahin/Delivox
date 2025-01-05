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
            SizedBox(height: 20,),
            Text("Password recovery ",style: TextStyle(fontSize: 22)),
            Text("Enter your email address to recover your password"),
            SizedBox(height: 50,),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Email address',
                hintStyle: TextStyle(color: Colors.blueGrey),
                prefixIcon: Icon(Icons.email,color: Colors.blueGrey,),
                contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16.0 * 1.5, vertical: 16.0),
              ),
              keyboardType: TextInputType.name,
              onSaved: (phone) {
                // Save it
              },
            ),
            SizedBox(height: 20,),

            CustomButton(onPressed: (){
             Get.to(OtpScreen());
            }, text: "Next", color: AppColors.primaryColor, txtcolor: Colors.white),
        
          ],
        ),
      ),
    );
  }
}