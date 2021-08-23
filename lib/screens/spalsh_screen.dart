import 'package:flutter/material.dart';
import 'package:test_app/services/language_service.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    languageService.getLanguages();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
