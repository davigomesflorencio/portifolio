import 'package:flutter/material.dart';

const Color kPrimaryColor = Color.fromRGBO(21, 181, 114, 1);
const Color kBackgroundColor = Color.fromRGBO(7, 17, 26, 1);
const Color kDangerColor = Color.fromRGBO(249, 77, 30, 1);
const Color kCaptionColor = Color.fromRGBO(166, 177, 187, 1);

final Shader linearGradient = const LinearGradient(
  colors: <Color>[Color(0xffDA44bb), Color(0xff8921aa)],
).createShader(const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

const double kDesktopMaxWidth = 1000.0;
const double kTabletMaxWidth = 760.0;
double getMobileMaxWidth(BuildContext context) =>
    MediaQuery.of(context).size.width * .8;
