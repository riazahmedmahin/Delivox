import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user_app/presentation/screen/onboarding_screen.dart';
import 'package:user_app/presentation/utility/app_theme_data.dart';

class courier extends StatelessWidget {
  const courier({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppThemeData.lightTheme,
      home:  OnboardingScreen(),
    );
  }
}