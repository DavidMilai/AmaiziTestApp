import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_app/routes.dart';
import 'package:test_app/services/language_service.dart';

class SelectLanguageScreen extends StatefulWidget {
  const SelectLanguageScreen({Key key}) : super(key: key);

  @override
  _SelectLanguageScreenState createState() => _SelectLanguageScreenState();
}

class _SelectLanguageScreenState extends State<SelectLanguageScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/bike.png"),
                fit: BoxFit.cover)),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.7),
                    border: Border.all(color: Colors.white54),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Text(
                  "Select Language",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey,
                  ),
                ),
              ),
              SizedBox(width: double.infinity, height: size.height * 0.05),
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white54),
                      color: Colors.white.withOpacity(0.5),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Column(
                    children: languageService.allLanguages
                        .map((language) => GestureDetector(
                              onTap: () => Navigator.pushNamed(
                                  context, RouteConfig.home),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 8, right: 8),
                                    child: Row(
                                      children: [
                                        Text(language.name,
                                            style: TextStyle(
                                                color: Colors.blueGrey)),
                                        Spacer(),
                                        Icon(Icons.check,
                                            color: Colors.blueGrey)
                                      ],
                                    ),
                                  ),
                                  Divider(color: Colors.white38)
                                ],
                              ),
                            ))
                        .toList(),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
