import 'package:flutter/material.dart';

import '../../config.dart';

class ProductsTab extends StatefulWidget {
  @override
  _ProductsTabState createState() => _ProductsTabState();
}

class _ProductsTabState extends State<ProductsTab> {
  int selectedIndex = 0;
  List<String> categories = [
    "Large Bottles",
    "Medium Bottles",
    "Small Bottles"
  ];
  Map<String, String> products = {
    "Big Bottles": "Big bottles description",
    "Medium Bottles": "Medium bottles description",
    "Small Bottles": "Small bottles description",
  };

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
            height: size.height * 0.09,
            width: double.infinity,
            color: kDefaultColor,
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                SizedBox(width: size.width * 0.31),
                Text(
                  "AMAIZI",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: kTextColor),
                ),
                Spacer(),
                Container(
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                        offset: Offset(3, 3),
                        blurRadius: 9,
                        color: Colors.black.withOpacity(0.3),
                      ),
                    ]),
                    child: Row(
                      children: [
                        Container(
                            height: 40,
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(8),
                                    topLeft: Radius.circular(8))),
                            child: Icon(
                              Icons.shopping_cart_outlined,
                              color: Colors.blueGrey,
                            )),
                        Container(
                            height: 40,
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: Colors.blueGrey.withOpacity(0.6),
                                borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(8),
                                    topRight: Radius.circular(8))),
                            child: Text(
                              "Empty",
                              style: TextStyle(color: Colors.white),
                            )),
                      ],
                    ))
              ],
            )),
        Container(
            height: 45,
            margin: EdgeInsets.only(top: 5, left: 5),
            child: ListView.builder(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      selectedIndex = index;
                      setState(() {});
                    },
                    child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 12.5, vertical: 7),
                        margin:
                            EdgeInsets.symmetric(horizontal: 2.5, vertical: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          color: selectedIndex == index
                              ? kDefaultColor
                              : Colors.white10,
                        ),
                        child: Row(
                          children: [
                            selectedIndex == index
                                ? Icon(
                                    Icons.check,
                                    color: Colors.blueGrey,
                                  )
                                : Container(),
                            SizedBox(width: 10),
                            Text(
                              categories[index],
                              style: TextStyle(color: Colors.blueGrey),
                            ),
                          ],
                        )),
                  );
                })),
        Expanded(
          child: ProductsGrid(
              title: products.keys.elementAt(selectedIndex),
              description: products.values.elementAt(selectedIndex)),
        )
      ],
    );
  }
}

class ProductsGrid extends StatelessWidget {
  ProductsGrid({this.title, this.description});
  final String title;
  final String description;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: 10,
        scrollDirection: Axis.vertical,
        physics: BouncingScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 5,
          mainAxisSpacing: 5,
        ),
        shrinkWrap: true,
        itemBuilder: (context, item) {
          return Container(
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    margin: EdgeInsets.all(20),
                    height: 130,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        border: Border.all(color: Colors.blueGrey)),
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    width: 25,
                    height: 25,
                    margin: EdgeInsets.only(right: 8, top: 8),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        border: Border.all(color: Colors.blueGrey),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(3, 3),
                            blurRadius: 9,
                            color: Colors.black.withOpacity(0.3),
                          ),
                        ]),
                    child: Icon(
                      Icons.add,
                      color: Colors.lightBlue,
                      size: 20,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: kTextColor),
                      ),
                      Text(
                        description,
                        style: TextStyle(color: kTextColor, fontSize: 12),
                      ),
                      Text(
                        "56000 FC",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: kTextColor),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        });
  }
}
