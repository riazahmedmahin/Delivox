import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:user_app/presentation/screen/forgetpassword.dart';
import 'package:user_app/presentation/screen/new_password.dart';
import 'package:user_app/presentation/widgets/custome_bottom.dart';

import '../utility/app_color.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          "OTP Verification",
          style: TextStyle(color: Color.fromARGB(255, 11, 0, 0)),
        ),
      ),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 16),
                  const Text(
                    "OTP Verification",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "We sent your code to +1 898 860 *** \nThis code will expired in 00:30",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Color(0xFF757575)),
                  ),
                  // const SizedBox(height: 16),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                  const OtpForm(),
                 // SizedBox(height: MediaQuery.of(context).size.height * 0.2),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Resend OTP Code",
                      style: TextStyle(color: Color(0xFF757575)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

const authOutlineInputBorder = OutlineInputBorder(
  borderSide: BorderSide(color: Color.fromARGB(255, 246, 243, 243)),
  borderRadius: BorderRadius.all(Radius.circular(12)),
);

class OtpForm extends StatelessWidget {
  const OtpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: 64,
                width: 64,
                child: TextFormField(
                  onSaved: (pin) {},
                  onChanged: (pin) {
                    if (pin.isNotEmpty) {
                      FocusScope.of(context).nextFocus();
                    }
                  },
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(1),
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  style: Theme.of(context).textTheme.titleLarge,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                      hintText: "*",
                      hintStyle: const TextStyle(color: Color.fromARGB(255, 193, 189, 189)),
                      border: authOutlineInputBorder,
                      enabledBorder: authOutlineInputBorder,
                      focusedBorder: authOutlineInputBorder.copyWith(
                          borderSide:
                          const BorderSide(color: Color.fromARGB(255, 14, 7, 1)))),
                ),
              ),
              SizedBox(
                height: 64,
                width: 64,
                child: TextFormField(
                  onSaved: (pin) {},
                  onChanged: (pin) {
                    if (pin.isNotEmpty) {
                      FocusScope.of(context).nextFocus();
                    }
                  },
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(1),
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  style: Theme.of(context).textTheme.titleLarge,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                      hintText: "*",
                      hintStyle: const TextStyle(color:Color.fromARGB(255, 193, 189, 189)),
                      border: authOutlineInputBorder,
                      enabledBorder: authOutlineInputBorder,
                      focusedBorder: authOutlineInputBorder.copyWith(
                          borderSide:
                          const BorderSide(color: Color.fromARGB(255, 252, 252, 252)))),
                ),
              ),
              SizedBox(
                height: 64,
                width: 64,
                child: TextFormField(
                  onSaved: (pin) {},
                  onChanged: (pin) {
                    if (pin.isNotEmpty) {
                      FocusScope.of(context).nextFocus();
                    }
                  },
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(1),
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  style: Theme.of(context).textTheme.titleLarge,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                      hintText: "*",
                      hintStyle: const TextStyle(color: Color.fromARGB(255, 193, 189, 189)),
                      border: authOutlineInputBorder,
                      enabledBorder: authOutlineInputBorder,
                      focusedBorder: authOutlineInputBorder.copyWith(
                          borderSide:
                          const BorderSide(color: Color.fromARGB(255, 253, 252, 252)))),
                ),
              ),
              SizedBox(
                height: 64,
                width: 64,
                child: TextFormField(
                  onSaved: (pin) {},
                  onChanged: (pin) {
                    if (pin.isNotEmpty) {
                      FocusScope.of(context).nextFocus();
                    }
                  },
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(1),
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  style: Theme.of(context).textTheme.titleLarge,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                      hintText: "*",
                      hintStyle: const TextStyle(color: Color.fromARGB(255, 193, 189, 189)),
                      border: authOutlineInputBorder,
                      enabledBorder: authOutlineInputBorder,
                      focusedBorder: authOutlineInputBorder.copyWith(
                          borderSide:
                          const BorderSide(color: Color.fromARGB(255, 252, 251, 251)))),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          CustomButton(onPressed: (){
            Get.to(New_Password());
          }, text: "Confirm", color: AppColors.primaryColor, txtcolor: Colors.white),

        ],
      ),
    );
  }
}
