import 'package:get/get.dart';
import '../controllers/Home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    // Pakai lazyPut biar hemat memori (dibuat pas kepakai aja)
    Get.lazyPut<TaskController>(() => TaskController());
  }
}
