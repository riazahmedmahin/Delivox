import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user_app/presentation/screen/success_password.dart';
import 'package:user_app/presentation/utility/app_color.dart';
import 'package:user_app/presentation/widgets/custome_bottom.dart';

class New_Password extends StatelessWidget {
  const New_Password({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(elevation: 0,),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20,),
            Text("Set New Password",style: TextStyle(fontSize: 22),),
            SizedBox(height: 10,),
            Text("Your new password must be different from previous used password"),
            SizedBox(height: 30,),
            TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.lock,color: Colors.grey,),
                hintText: 'New Psssword',
                hintStyle: TextStyle(color: Colors.grey)
              ),
            ),
            SizedBox(height:10,),
            TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.lock,color: Colors.grey,),
                hintText: ' Confrim New Password',
                hintStyle: TextStyle(color: Colors.grey)
              ),
            ),
            SizedBox(height: 20,),
            CustomButton(onPressed: (){
            Get.to(SuccessfulScreen());
          }, text: "Confirm", color: Color(0xFF22A45D), txtcolor: Colors.white),

          ],
        ),
      ),

    );
  }
}