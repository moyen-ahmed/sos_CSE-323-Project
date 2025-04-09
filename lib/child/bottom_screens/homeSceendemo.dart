import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'dart:math';
import 'package:sos_app/widgets/home_widgets/custom_appBar.dart';
import 'package:sos_app/utils/quotes.dart';
import 'package:sos_app/widgets/SafeWebView.dart';
import 'package:sos_app/widgets/home_widgets/emergency.dart';
import 'package:sos_app/widgets/home_widgets/homesafe/SafeHome.dart';
import 'package:sos_app/widgets/livesafe.dart';
import 'package:animate_do/animate_do.dart';

class HomeScreen1 extends StatefulWidget {
  @override
  State<HomeScreen1> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen1> {
  int qIndex = 2;

  void getRandomQuote() {
    Random random = Random();
    setState(() {
      qIndex = random.nextInt(sweetSayings.length);
    });
  }

  @override
  void initState() {
    getRandomQuote();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(8.0),
          children: [
            CustomAppbar(
              quoteIndex: qIndex,
              onTap: getRandomQuote,
            ),
            const SizedBox(height: 20),
            // Animated Carousel
            FadeInUp(
              duration: const Duration(milliseconds: 800),
              child: Container(
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      spreadRadius: 2,
                      offset: Offset(0, 4),
                    )
                  ],
                ),
                child: CarouselSlider.builder(
                  options: CarouselOptions(
                    height: 200.0,
                    autoPlay: true,
                    enlargeCenterPage: true,
                    viewportFraction: 0.85,
                    pageSnapping: true,
                    autoPlayAnimationDuration: Duration(seconds: 1),
                  ),
                  itemCount: imageSliders.length,
                  itemBuilder: (context, index, realIndex) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SafeWebView(url: webLinks[index]),
                          ),
                        );
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Stack(
                          children: [
                            Image.network(
                              imageSliders[index],
                              fit: BoxFit.cover,
                              width: MediaQuery.of(context).size.width,
                            ),
                            Positioned(
                              bottom: 20,
                              left: 20,
                              right: 20,
                              child: Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: Colors.black54,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Text(
                                  imageTexts[index],
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 20),
            FadeInLeft(
              duration: const Duration(milliseconds: 700),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Emergency",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Emergency(),
            FadeInLeft(
              duration: const Duration(milliseconds: 700),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Explore Live Safe",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            LiveSafe(),
            BounceInUp(
              duration: Duration(milliseconds: 800),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: SafeHome(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
