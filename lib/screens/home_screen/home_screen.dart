import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_app/screens/home_screen/products_tab.dart';
import 'package:test_app/screens/home_screen/profile_tab.dart';

import '../../config.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int tab = 0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: tab == 0 ? ProductsTab() : ProfileTab(),
        persistentFooterButtons: [
          Container(
            height: 50,
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () => setState(() => tab = 0),
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child: Icon(
                        Icons.home_outlined,
                        color: kTextColor,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () => setState(() => tab = 1),
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child: Icon(
                        Icons.person_outline,
                        color: kTextColor,
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
