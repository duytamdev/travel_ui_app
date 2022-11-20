import 'package:flutter/material.dart';
import 'package:travel_ui_app/core/helpers/image_helper.dart';
import 'package:travel_ui_app/representation/screens/intro_screen.dart';

import '../../core/constants/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  static String routeName = "/splash";

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void redirectToIntroScreen() async {
    await Future.delayed(const Duration(seconds: 3));
    // ignore: use_build_context_synchronously
    Navigator.of(context).pushReplacementNamed(IntroScreen.routeName);
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    redirectToIntroScreen();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(child:
         Container(
           decoration: const BoxDecoration(
             gradient: Gradients.defaultGradientBackground,
           ),
         )
          ),
          Positioned.fill(child:
          ImageHelper.loadFromAssets(
            ImageHelper.getAssetImage("circle_splash.png"),
            fit: BoxFit.cover,
          ),
          )
        ]
      )
    );
  }
}
