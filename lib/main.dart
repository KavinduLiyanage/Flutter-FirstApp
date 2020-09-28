import 'package:flutter/material.dart';
import 'package:flutter_app2/widgets/bottom_nav_bar.dart';
import 'package:flutter_app2/widgets/category_card.dart';
import 'package:flutter_svg/svg.dart';

import 'constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hemas Health',
      theme: ThemeData(
        fontFamily: "Cairo",
        scaffoldBackgroundColor: kBackgroundColor,
        textTheme: Theme.of(context).textTheme.apply(displayColor: kTextColor),
      ),
      home: Dashboard(),
    );
  }
}

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context)
        .size; //this gonna give us total height and with of our device
    return Scaffold(
      bottomNavigationBar: BottomNavBar(),
      body: Stack(
        children: <Widget>[
          Container(
            // Here the height of the container is 45% of our total height
            height: size.height * .35,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    kBackgroundColor1,
                    kBackgroundColor2,
                  ]
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(26),
                bottomRight: Radius.circular(26),
              ),
              image: DecorationImage(
                alignment: Alignment.centerLeft,
                image: AssetImage("assets/images/undraw_pilates_gpdb.png"),
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      alignment: Alignment.center,
                      height: 62,
                      width: 32,

                      child: SvgPicture.asset("assets/icons/menuIcon.svg"),
                    ),
                  ),
                  Text(
                    "Dashboard",
                    style: Theme.of(context)
                        .textTheme
                        .display1
                        .copyWith(fontWeight: FontWeight.w700),
                  ),

                  Expanded(
                    child: GridView.count(
                      crossAxisCount: 2,
                      childAspectRatio: 1,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      children: <Widget>[
                        CategoryCard(
                          title: "Channel a Doctor",
                          svgSrc: "assets/icons/ChannelaDoctor2.svg",
                          press: () {},
                        ),
                        CategoryCard(
                          title: "Order Medicine",
                          svgSrc: "assets/icons/OrderMedicine2.svg",
                          press: () {},
                        ),
                        CategoryCard(
                          title: "Lab Reports",
                          svgSrc: "assets/icons/OrderMedicine2.svg",
                          press: () {

                          },
                        ),
                        CategoryCard(
                          title: "Feedback",
                          svgSrc: "assets/icons/ChannelaDoctor2.svg",
                          press: () {},
                        ),
                        CategoryCard(
                          title: "Video Calls",
                          svgSrc: "assets/icons/ChannelaDoctor2.svg",
                          press: () {},
                        ),
                        CategoryCard(
                          title: "Contact Us",
                          svgSrc: "assets/icons/OrderMedicine2.svg",
                          press: () {},
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}