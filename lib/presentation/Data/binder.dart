import 'package:get/get.dart';
import 'package:user_app/presentation/Data/StateHolder/categoryController.dart';

class ControllerBinder extends Bindings {
  @override
  void dependencies() {
   Get.put(CategoryListController());

  }
}