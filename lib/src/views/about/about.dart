import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:outline_gradient_button/outline_gradient_button.dart';
import 'package:portifolio/src/utils/screen_helper.dart';

class About extends StatefulWidget {
  const About({Key? key}) : super(key: key);

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    double carouselContainerHeight = MediaQuery.of(context).size.height *
        (ScreenHelper.isMobile(context) ? .7 : .85);

    return SizedBox(
      height: carouselContainerHeight,
      child: ScreenHelper(
        mobile: AboutMobile(),
        tablet: AboutTablet(),
        desktop: AboutDestop(),
      ),
    );
  }

  Widget AboutMobile() {
    return SizedBox();
  }

  Widget AboutTablet() {
    return SizedBox();
  }

  Widget AboutDestop() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.only(right: 100),
          child: Image.asset(
            "assets/images/icon.png",
            fit: BoxFit.cover,
            height: MediaQuery.of(context).size.height * 0.6,
          ),
        ),
        Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Sobre mim",
                style: GoogleFonts.oswald(
                  color: Colors.white,
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Ceará, Brasil",
                style: GoogleFonts.oswald(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                width: 300,
                child: Text(
                  "Desenvolvedor back-end/Mobile, com experiência de atuação em grandes projetos. \nMe reconheço como entusiasta em novas tecnologias do mercado, com aprendizado adquirido dia após dia. \nPossuo foco em desenvolvimento em Java, Python, TypeScript, Dart, NodeJS dentre outras tecnologias",
                  textAlign: TextAlign.justify,
                  style: GoogleFonts.oswald(
                    color: Colors.white,
                    fontSize: 14.0,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: itemsInfo(),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget itemsInfo() {
    return Row(
      children: [
        OutlineGradientButton(
          // backgroundColor: Colors.pink,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Image.asset(
                  "assets/images/nuvem.png",
                  height: 20,
                  color: Colors.pink,
                ),
              ),
              Text(
                'Curriculo',
                style: GoogleFonts.oswald(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          inkWell: true,
          onTap: () {},
          gradient: const LinearGradient(
            colors: [Colors.purple, Colors.pink],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          strokeWidth: 4,
          radius: const Radius.circular(8),
        ),
        const SizedBox(
          width: 20,
        ),
        OutlineGradientButton(
          // backgroundColor: Colors.pink,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Image.asset(
                  "assets/images/email.png",
                  height: 20,
                  color: Colors.pink,
                ),
              ),
              Text(
                'Email',
                style: GoogleFonts.oswald(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          inkWell: true,
          onTap: () {},
          gradient: const LinearGradient(
            colors: [Colors.purple, Colors.pink],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          strokeWidth: 4,
          radius: const Radius.circular(8),
        ),
      ],
    );
  }
}
