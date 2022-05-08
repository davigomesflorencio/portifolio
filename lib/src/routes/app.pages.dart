import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:portifolio/src/modules/main/nav.binding.dart';
import 'package:portifolio/src/modules/main/nav.page.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: '/',
      page: () => const NavPage(),
      binding: NavBind(),
    ),
  ];
}
