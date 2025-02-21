import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user_app/app.dart';
import 'package:user_app/presentation/Data/StateHolder/categoryController.dart';

void main() {
   Get.put(CategoryListController()); 
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const courier());
}