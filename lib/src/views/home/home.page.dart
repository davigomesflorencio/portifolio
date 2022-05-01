import 'package:flutter/material.dart';
import 'package:portifolio/src/views/home/components/carousel.dart';
import 'package:portifolio/src/views/home/components/header.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Header(),
            Carousel(),
            SizedBox(
              height: 20.0,
            ),
          ],
        ),
      ),
    );
  }
}
