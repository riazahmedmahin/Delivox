import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:user_app/presentation/screen/forgetpassword.dart';
import 'package:user_app/presentation/utility/app_color.dart';
import 'package:user_app/presentation/widgets/custome_bottom.dart';

class SignInScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  SignInScreen({super.key});
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
                children: [
                  SizedBox(height: constraints.maxHeight * 0.1),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.network(
                        "https://cdn-icons-png.flaticon.com/128/3665/3665927.png",
                        height: 50,
                      ),
                      Text(
                        "elivox",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.w900),
                      )
                    ],
                  ),
                  SizedBox(height: constraints.maxHeight * 0.1),
                  Text(
                    "Sign In",
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .copyWith(fontWeight: FontWeight.bold),
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
                            hintText: 'Phone',
                            hintStyle: TextStyle(color: Colors.grey),
                            prefixIcon: Icon(
                              Icons.call,
                              color: Colors.grey,
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 16.0 * 1.5, vertical: 16.0),
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
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 16.0 * 1.5, vertical: 16.0),
                          ),
                          onSaved: (passaword) {
                            // Save it
                          },
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              onPressed: () {
                                Get.to(ForgetPassword());
                              },
                              child: Text(
                                'Forgot Password?',
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
                        SizedBox(
                          height: 5,
                        ),
                        CustomButton(
                            onPressed: () {},
                            text: "Sign In",
                            color: Color(0xFF22A45D),
                            txtcolor: Colors.white),
                        const SizedBox(height: 16.0),
                        TextButton(
                          onPressed: () {},
                          child: Text.rich(
                            const TextSpan(
                              text: "Don’t have an account? ",
                              children: [
                                TextSpan(
                                  text: "Sign Up",
                                  style: TextStyle(color: Color(0xFF22A45D)),
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
        SizedBox(
          width: 100, // Set your desired width
          child: Divider(
            color: Colors.grey.shade300,
            thickness: 1, // Adjust thickness if needed
          ),
        ),
        SizedBox(
          width: 6,
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
          width: 6,
        ),
        SizedBox(
          width: 100, // Set your desired width
          child: Divider(
            color: Colors.grey.shade300,
            thickness: 1, // Adjust thickness if needed
          ),
        ),
      ],
    );
  }
}
