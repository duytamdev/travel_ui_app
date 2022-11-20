import 'dart:async';

import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:travel_ui_app/core/constants/dismesion.dart';
import 'package:travel_ui_app/core/constants/textstyle_ext.dart';
import 'package:travel_ui_app/core/helpers/image_helper.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);
  static String routeName = "/intro";

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final PageController _pageController = PageController(viewportFraction: 0.8);
  final StreamController<int> _streamController = StreamController<int>();

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      _streamController.add(_pageController.page!.toInt());
    });
  }

  static const List _listData = [
    {
      "title": "Book a flight",
      "subTitle":
          "Found a flight that matches your destination and schedule? Book it instantly",
      "image": "slide1.png",
      "alignment": Alignment.centerRight,
    },
    {
      "title": "Find a hotel room",
      "subTitle": "Select the day, book your room. We give you the best price.",
      "image": "slide2.png",
      "alignment": Alignment.center,
    },
    {
      "title": "Enjoy your trip",
      "subTitle":
          "Easy discovering new places and share these between your friends and travel together",
      "image": "slide3.png",
      "alignment": Alignment.centerLeft,
    },
  ];

  void onPressSkip() {
    if (_pageController.page == _listData.length - 1) {
      Navigator.of(context).pushReplacementNamed("/home");
    } else {
      _pageController.nextPage(
          duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
    }
  }

  Widget _buildItemIntroScreen(
      String title, String description, String image, Alignment alg) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              alignment: alg,
              child: ImageHelper.loadFromAssets(
                  ImageHelper.getAssetImage(image),
                  height: 400,
                  fit: BoxFit.fitHeight,
                  radius: const BorderRadius.all(Radius.circular(8)))),
          const SizedBox(
            height: kMediumPadding * 2,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: kMediumPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyles.defaultStyle.bold,
                ),
                Text(
                  description,
                  style: TextStyles.defaultStyle,
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      PageView(
        controller: _pageController,
        children: _listData
            .map((e) => _buildItemIntroScreen(
                  e["title"],
                  e["subTitle"],
                  e["image"],
                  e["alignment"],
                ))
            .toList(),
      ),
      Positioned(
          left: kMediumPadding,
          right: kMediumPadding,
          bottom: kMediumPadding * 2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SmoothPageIndicator(
                controller: _pageController,
                count: _listData.length,
                effect: ExpandingDotsEffect(
                    dotColor: Colors.blue.shade300,
                    activeDotColor: Colors.blue,
                    dotHeight: 8,
                    dotWidth: 8,
                    expansionFactor: 4,
                    spacing: 8),
              ),
              GestureDetector(
                  onTap: onPressSkip,
                  child: StreamBuilder<int>(
                      initialData: 0,
                      stream: _streamController.stream,
                      builder: (context, snapshot) {
                        return Text(
                          snapshot.data != 2 ? 'Next' : 'Get Started',
                          style: TextStyles.defaultStyle.primaryTextColor.bold,
                        );
                      }))
            ],
          ))
    ]));
  }
}
