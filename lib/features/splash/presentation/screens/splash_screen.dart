import 'dart:async';

import 'package:flutter/material.dart';
import 'package:quotes/config/routes/app_routes.dart';
import 'package:quotes/core/utils/assets_manager.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Timer _timer;

  void _goNext() =>
      Navigator.of(context).pushReplacementNamed(AppRoutes.randomQuoteRoute);

  _startDelay() {
    _timer = Timer(Duration(seconds: 2), () => _goNext());
  }

  @override
  void initState() {
    super.initState();
    _startDelay();
  }
  @override
  void dispose() {
    
    super.dispose();
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(ImageAssets.quote),
      ),
    );
  }
}
