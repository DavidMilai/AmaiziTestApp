import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../config.dart';

class ProductsTab extends StatefulWidget {
  @override
  _ProductsTabState createState() => _ProductsTabState();
}

class _ProductsTabState extends State<ProductsTab> {
  int selectedIndex = 0;
  ItemScrollController _scrollController = ItemScrollController();
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
  void initState() {
    // TODO: implement initState
    super.initState();
  }

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
                      _scrollController.scrollTo(
                          index: selectedIndex, duration: Duration(seconds: 1));
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
          child: ScrollablePositionedList.builder(
            itemScrollController: _scrollController,
            itemPositionsListener: ItemPositionsListener.create(),
            itemCount: categories.length,
            itemBuilder: (context, item) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    color: Colors.grey.withOpacity(0.05),
                    child: Padding(
                      padding: EdgeInsets.only(left: 20, bottom: 5),
                      child: Text(categories[item],
                          style:
                              TextStyle(color: Colors.blueGrey, fontSize: 20)),
                    ),
                  ),
                  ProductsGrid(
                      title: products.keys.elementAt(item),
                      description: products.values.elementAt(item)),
                ],
              );
            },
          ),
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
                    margin: EdgeInsets.only(
                        left: 20, right: 20, bottom: 20, top: 10),
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
                    margin: EdgeInsets.only(right: 10),
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
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 20),
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
                  ),
                )
              ],
            ),
          );
        });
  }
}
