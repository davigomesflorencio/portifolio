import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:outline_gradient_button/outline_gradient_button.dart';
import 'package:portifolio/src/core/utils/screen_helper.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:url_launcher/url_launcher.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double carouselContainerHeight = MediaQuery.of(context).size.height *
        (ScreenHelper.isMobile(context) ? .7 : .85);

    return SizedBox(
      height: carouselContainerHeight,
      child: ScreenHelper(
        desktop: Stack(
          children: [
            SvgPicture.asset(
              "assets/images/looper.svg",
              allowDrawingOutsideViewBox: true,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 100),
                  child: textInfoProfile(),
                ),
              ],
            ),
          ],
        ),
        mobile: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            textInfoProfile(),
          ],
        ),
        tablet: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            textInfoProfile(),
          ],
        ),
      ),
    );
  }

  Future<void> _launchInUrl(Uri url) async {
    if (await canLaunchUrl(
      url,
    )) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Image imageProfile() {
    return Image.asset(
      'assets/images/icon.png',
      fit: BoxFit.cover,
    );
  }

  Column textInfoProfile() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Olá, eu sou",
          style: GoogleFonts.oswald(
            color: Colors.white,
            fontSize: 32.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        GradientText(
          'Davi Gomes Florencio',
          style: GoogleFonts.oswald(
            fontSize: 40.0,
            fontWeight: FontWeight.bold,
          ),
          colors: const [
            Colors.purple,
            Colors.pink,
          ],
        ),
        Text(
          "Desenvolvedor Back-end/Mobile",
          style: GoogleFonts.oswald(
            color: Colors.white,
            fontSize: 32.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            OutlineGradientButton(
              // backgroundColor: Colors.pink,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Image.asset(
                      "assets/images/github.png",
                      height: 20,
                      color: Colors.pink,
                    ),
                  ),
                  Text(
                    'Github',
                    style: GoogleFonts.oswald(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              inkWell: true,
              onTap: () {
                _launchInUrl(
                  Uri.parse("https://github.com/davigomesflorencio"),
                );
              },
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
                      "assets/images/linkedin.png",
                      height: 20,
                      color: Colors.pink,
                    ),
                  ),
                  Text(
                    'Linkedin',
                    style: GoogleFonts.oswald(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              inkWell: true,
              onTap: () {
                _launchInUrl(
                    Uri.parse("https://www.linkedin.com/in/davi-g-883b7a12a/"));
              },
              gradient: const LinearGradient(
                colors: [Colors.purple, Colors.pink],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              strokeWidth: 4,
              radius: const Radius.circular(8),
            ),
          ],
        )
      ],
    );
  }
}
