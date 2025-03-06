import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:user_app/presentation/screen/Forgetpassword.dart';
import 'package:user_app/presentation/screen/SignIn_Screnn.dart';
import 'package:user_app/presentation/utility/app_color.dart';
import 'package:user_app/presentation/widgets/custome_bottom.dart';

class SignUpScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  SignUpScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: constraints.maxHeight * 0.1),
                  SizedBox(height: constraints.maxHeight * 0.1),
                  Text(
                    "Create Account!",
                    style: Theme.of(context)
                        .textTheme
                        .headlineLarge!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "You have to see you again to your accout",
                    style: TextStyle(color: Colors.grey.shade500),
                  ),
                  SizedBox(height: constraints.maxHeight * 0.05),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black)),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8))),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                              borderSide: BorderSide(
                                color: Colors.grey,
                              ), // Border when focused
                            ),
                            hintText: 'Email',
                            hintStyle: TextStyle(color: Colors.grey),
                            prefixIcon: Icon(
                              Icons.email,
                              color: Colors.grey,
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 16.0 * 1.5, vertical: 14.0),
                          ),
                          keyboardType: TextInputType.text,
                          onSaved: (phone) {
                            // Save it
                          },
                        ),
                        SizedBox(height: 15),
                        TextFormField(
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black)),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8))),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                              borderSide: BorderSide(
                                color: Colors.grey,
                              ), // Border when focused
                            ),
                            hintText: 'Phone',
                            hintStyle: TextStyle(color: Colors.grey),
                            prefixIcon: Icon(
                              Icons.call,
                              color: Colors.grey,
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 16.0 * 1.5, vertical: 14.0),
                          ),
                          keyboardType: TextInputType.phone,
                          onSaved: (phone) {
                            // Save it
                          },
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          obscureText: true,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black)),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8))),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                              borderSide: BorderSide(
                                color: Colors.grey,
                              ), // Border when focused
                            ),
                            hintText: 'Password',
                            hintStyle: TextStyle(color: Colors.grey),
                            prefixIcon: Icon(
                              Icons.password_rounded,
                              color: Colors.grey,
                            ),
                            suffixIcon: Icon(Icons.remove_red_eye_sharp,color: Colors.grey,),
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 16.0 * 1.5, vertical: 14.0),
                          ),
                          onSaved: (passaword) {
                            // Save it
                          },
                        ),

                        SizedBox(
                          height: 25,
                        ),
                        CustomButton(
                            onPressed: () {},
                            text: "Create",
                            color: const Color(0xFF4A3298),
                            txtcolor: Colors.white),
                        const SizedBox(height: 16.0),
                        TextButton(
                          onPressed: () {
                            Get.to(()=>SignInScreen());
                          },
                          child: Text.rich(
                            const TextSpan(
                              text: "Have an account? ",
                              children: [
                                TextSpan(
                                  text: "Sign In",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 21, 5, 79)),
                                ),
                              ],
                            ),
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .color!
                                      .withOpacity(0.64),
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  socialwithSignIn(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class socialwithSignIn extends StatelessWidget {
  const socialwithSignIn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(8)),
          child: ClipRRect(
              child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Image.network(
              "https://cdn-icons-png.flaticon.com/128/281/281764.png",
              fit: BoxFit.cover,
            ),
          )),
        ),
        SizedBox(
          width: 12,
        ),
        Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(8)),
          child: ClipRRect(
              child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Image.network(
              "https://cdn-icons-png.flaticon.com/128/0/747.png",
              fit: BoxFit.cover,
            ),
          )),
        ),
        SizedBox(
          width: 12,
        ),
        Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(8)),
          child: ClipRRect(
              child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Image.network(
              "https://cdn-icons-png.flaticon.com/128/5968/5968764.png",
              fit: BoxFit.cover,
            ),
          )),
        ),
      ],
    );
  }
}
