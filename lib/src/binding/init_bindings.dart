import 'package:flutter_clone/src/controller/BottomNavController.dart';
import 'package:get/get.dart';

class InitBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
      BottomNavController(),
      permanent: true,
    );
  }
}
