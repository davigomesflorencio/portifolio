import 'package:get/get.dart';
import 'package:portifolio/src/modules/main/nav.controller.dart';

class NavBind extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NavController>(() {
      return NavController();
    });
  }
}
