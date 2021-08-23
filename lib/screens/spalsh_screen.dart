import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_app/services/language_service.dart';

import '../routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void navigate() async {
    await Future.delayed(Duration(seconds: 2));
    Navigator.pushReplacementNamed(context, RouteConfig.selectlanguage);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    languageService.getLanguages();
    navigate();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/bike.png"),
                fit: BoxFit.cover)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: double.infinity,
            ),
            ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.asset(
                  "assets/images/logo.png",
                  width: 150,
                  height: 150,
                )),
          ],
        ),
      ),
    );
  }
}
