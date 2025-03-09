import 'package:flutter/material.dart';
// TODO: add flutter_svg package to pubspec.yaml
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:user_app/presentation/screen/SignIn_Screnn.dart';
import 'package:user_app/presentation/utility/app_color.dart';
import 'package:user_app/presentation/widgets/custome_bottom.dart';
import 'package:user_app/presentation/widgets/mainbottom.dart';

class SuccessfulScreen extends StatelessWidget {
  const SuccessfulScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const Spacer(flex: 2),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Image.network("https://cdn-icons-png.flaticon.com/256/9821/9821311.png",
                  height: 20,
                  width: 20,
                  )
                ),
              ),
              const Spacer(flex: 2),
              ErrorInfo(
                title: "",
                description:
                    "Your Password hasbeen change successfully",
                // button: you can pass your custom button,
                btnText: "Track Order",
                press: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ErrorInfo extends StatelessWidget {
  const ErrorInfo({
    super.key,
    required this.title,
    required this.description,
    this.button,
    this.btnText,
    required this.press,
  });

  final String title;
  final String description;
  final Widget? button;
  final String? btnText;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 400),
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(
              description,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16 * 2.5),
            button ??
            CustomButton(onPressed: (){
            Get.to(BottomNavScreen());
          }, text: "Sucessful", color: Color(0xFF4A3298), txtcolor: Colors.white),
  
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

//
