import 'package:flutter/material.dart';

import '../../config.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({Key key}) : super(key: key);

  @override
  _ProfileTabState createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      color: Colors.white10,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              height: size.height * 0.09,
              width: double.infinity,
              color: kDefaultColor,
              padding: EdgeInsets.all(10),
              child: Center(
                child: Text(
                  "PROFILE",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: kTextColor),
                ),
              )),
          SizedBox(height: 20),
          profileTile(title: "Login", icon: Icons.person_outline),
          SizedBox(height: 40),
          profileTile(title: "Addresses", icon: Icons.location_on_outlined),
          profileTile(title: "Support", icon: Icons.question_answer_outlined),
          SizedBox(height: 40),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text("Language", style: TextStyle(color: Colors.blueGrey)),
          ),
          SizedBox(height: 30),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.symmetric(
                    horizontal:
                        BorderSide(color: Colors.grey.withOpacity(0.3)))),
            child: Row(
              children: [
                SizedBox(width: 10),
                Container(height: 15, width: 1, color: Colors.grey),
                SizedBox(width: 10),
                Text("English", style: TextStyle(color: Colors.blueGrey)),
                Spacer(),
                Icon(
                  Icons.arrow_forward_ios,
                  color: kTextColor,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container profileTile({String title, IconData icon}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.symmetric(
              horizontal: BorderSide(color: Colors.grey.withOpacity(0.3)))),
      child: Row(
        children: [
          Icon(icon, color: kTextColor, size: 30),
          SizedBox(width: 10),
          Container(height: 15, width: 1, color: Colors.grey),
          SizedBox(width: 10),
          Text(title, style: TextStyle(color: Colors.blueGrey)),
          Spacer(),
          Icon(
            Icons.arrow_forward_ios,
            color: kTextColor,
          )
        ],
      ),
    );
  }
}
