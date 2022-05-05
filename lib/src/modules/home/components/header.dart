import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portifolio/src/core/utils/screen_helper.dart';
import 'package:portifolio/src/data/model/header_item.dart';
import 'package:responsive_framework/responsive_framework.dart';

class HeaderLogo extends StatefulWidget {
  const HeaderLogo({Key? key}) : super(key: key);

  @override
  State<HeaderLogo> createState() => _HeaderLogoState();
}

class _HeaderLogoState extends State<HeaderLogo> {
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

class HeaderRow extends StatefulWidget {
  HeaderRow({Key? key}) : super(key: key);

  @override
  State<HeaderRow> createState() => _HeaderRowState();
}

class _HeaderRowState extends State<HeaderRow> {
  late int selectedItemHeader = 0;
  late List<HeaderItem> headerItems = [
    HeaderItem(
      title: "HOME",
      onTap: () {
        setState(() {
          selectedItemHeader = 0;
          print(selectedItemHeader);

          setHeadertItemSelected(0);
        });
      },
      isButton: true,
    ),
    HeaderItem(
      title: "SOBRE MIM",
      onTap: () {
        setState(() {
          selectedItemHeader = 1;
          print(selectedItemHeader);
          setHeadertItemSelected(1);
        });
      },
      isButton: false,
    ),
    HeaderItem(
      title: "EXPERIÊNCIA",
      onTap: () {
        setState(() {
          selectedItemHeader = 2;
          print(selectedItemHeader);

          setHeadertItemSelected(2);
        });
      },
      isButton: false,
    ),
    HeaderItem(
      title: "PROJETOS",
      onTap: () {
        setState(() {
          selectedItemHeader = 3;
          print(selectedItemHeader);
          setHeadertItemSelected(3);
        });
      },
      isButton: false,
    ),
    HeaderItem(
      title: "REDES SOCIAIS",
      onTap: () {
        setState(() {
          selectedItemHeader = 4;
          print(selectedItemHeader);
          setHeadertItemSelected(4);
        });
      },
      isButton: false,
    ),
    // HeaderItem(
    //   title: "HIRE ME",
    //   onTap: () {},
    //   isButton: true,
    // ),
  ];

  setHeadertItemSelected(int position) {
    headerItems[position].isButton = true;
    for (int i = 0; i <= 4; i++) {
      if (i != position) {
        headerItems[position].isButton = false;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      headerItems[this.selectedItemHeader].isButton = true;
    });

    return ResponsiveVisibility(
      visible: false,
      visibleWhen: const [
        Condition.largerThan(name: MOBILE),
      ],
      child: Row(
        children: headerItems
            .map(
              (item) => headerItems.indexOf(item) == selectedItemHeader
                  ? MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedItemHeader = headerItems.indexOf(item);
                            print("---" + selectedItemHeader.toString());
                            setHeadertItemSelected(selectedItemHeader);
                          });
                        },
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
                              width: 50,
                              decoration: BoxDecoration(
                                color: Colors.pink,
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ],
                        ),
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
  int selectHeaderItem;
  Header({Key? key, required this.selectHeaderItem}) : super(key: key);

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
        children: [
          const HeaderLogo(),
          HeaderRow(),
        ],
      ),
    );
  }
}
