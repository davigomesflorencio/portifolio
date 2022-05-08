import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portifolio/src/modules/about/about.dart';
import 'package:portifolio/src/modules/home/components/header.dart';
import 'package:portifolio/src/modules/home/home.dart';
import 'package:portifolio/src/modules/main/nav.controller.dart';

class NavPage extends StatefulWidget {
  const NavPage({Key? key}) : super(key: key);

  @override
  State<NavPage> createState() => _NavPageState();
}

class _NavPageState extends State<NavPage> {
  NavController navController = Get.find();

  List<Widget> listWidgets = const [
    Home(),
    About(),
    Text("2"),
    Text("3"),
    Text("4"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Obx(() {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Header(
                selectHeaderItem: navController.widgetSelect.value,
              ),
              listWidgets[navController.widgetSelect.value],
              const SizedBox(
                height: 20.0,
              ),
            ],
          );
        }),
      ),
    );
  }
}
