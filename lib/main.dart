import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portifolio/src/routes/app.pages.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:responsive_framework/utils/scroll_behavior.dart';

import 'src/core/utils/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Xing Gomes - Dev Back End/Mobile',
      themeMode: ThemeMode.dark,
      darkTheme: Theme.of(context).copyWith(
        platform: TargetPlatform.android,
        scaffoldBackgroundColor: kBackgroundColor,
        primaryColor: kPrimaryColor,
        canvasColor: kBackgroundColor,
        textTheme: GoogleFonts.latoTextTheme(),
      ),
      builder: (context, widget) => ResponsiveWrapper.builder(
        ClampingScrollWrapper.builder(context, widget!),
        defaultScale: true,
        breakpoints: const [
          ResponsiveBreakpoint.resize(450, name: MOBILE),
          ResponsiveBreakpoint.resize(800, name: TABLET),
          ResponsiveBreakpoint.resize(1000, name: TABLET),
          ResponsiveBreakpoint.resize(1200, name: DESKTOP),
          ResponsiveBreakpoint.resize(2460, name: "4K"),
        ],
        background: Container(
          color: kBackgroundColor,
        ),
      ),
      initialRoute: '/',
      getPages: AppPages.pages,
    );
  }
}
