import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portifolio/src/models/header_item.dart';
import 'package:portifolio/src/utils/screen_helper.dart';
import 'package:responsive_framework/responsive_framework.dart';

List<HeaderItem> headerItems = [
  HeaderItem(
    title: "HOME",
    onTap: () {},
    isButton: true,
  ),
  HeaderItem(
    title: "SOBRE MIM",
    onTap: () {},
  ),
  HeaderItem(
    title: "EXPERIÊNCIA",
    onTap: () {},
  ),
  HeaderItem(
    title: "PROJETOS",
    onTap: () {},
  ),
  HeaderItem(
    title: "REDES SOCIAIS",
    onTap: () {},
  ),
  // HeaderItem(
  //   title: "HIRE ME",
  //   onTap: () {},
  //   isButton: true,
  // ),
];

class HeaderLogo extends StatelessWidget {
  const HeaderLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {},
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                right: 10,
                top: 4,
              ),
              child: Image.asset(
                "assets/images/icon.png",
                height: 28,
              ),
            ),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "XING",
                    style: GoogleFonts.oswald(
                      color: Colors.white,
                      fontSize: 32.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: ".",
                    style: GoogleFonts.oswald(
                      color: Colors.pink,
                      fontSize: 36.0,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HeaderRow extends StatelessWidget {
  const HeaderRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveVisibility(
      visible: false,
      visibleWhen: const [
        Condition.largerThan(name: MOBILE),
      ],
      child: Row(
        children: headerItems
            .map(
              (item) => item.isButton
                  ? MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 30.0,
                              // vertical: 5.0,
                            ),
                            child: Text(
                              item.title,
                              style: const TextStyle(
                                color: Colors.pink,
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Container(
                            height: 4,
                            width: 40,
                            color: Colors.pink,
                          ),
                        ],
                      ),
                    )
                  : MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: Container(
                        margin: const EdgeInsets.only(right: 30.0),
                        child: GestureDetector(
                          onTap: item.onTap,
                          child: Text(
                            item.title,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 13.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
            )
            .toList(),
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenHelper(
      desktop: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: buildHeader(),
      ),
      // We will make this in a bit
      mobile: buildMobileHeader(),
      tablet: buildHeader(),
    );
  }

  // mobile header
  Widget buildMobileHeader() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            HeaderLogo(),
          ],
        ),
      ),
    );
  }

  // Lets plan for mobile and smaller width screens
  Widget buildHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          HeaderLogo(),
          HeaderRow(),
        ],
      ),
    );
  }
}
