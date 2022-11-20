import 'package:flutter/material.dart';
import 'package:travel_ui_app/representation/screens/intro_screen.dart';

import 'representation/screens/splash_screen.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => const SplashScreen(),
  IntroScreen.routeName: (context) => const IntroScreen(),
};