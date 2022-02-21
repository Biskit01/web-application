import 'package:flutter/material.dart';
import 'package:flutter_web_example/home/helpers/responsive.dart';
import 'package:flutter_web_example/home/helpers/style.dart';
import 'package:flutter_web_example/home/home/widgets/desktop.dart';
import 'package:flutter_web_example/home/home/widgets/mobile.dart';
import 'package:flutter_web_example/home/widgets/navbar_desktop.dart';
import 'package:flutter_web_example/home/widgets/drawer.dart';
import 'package:flutter_web_example/home/widgets/mobile_navbar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
        key: scaffoldKey,
        appBar: ResponsiveWidget.isSmallScreen(context)
            ? mobileTopBar(scaffoldKey)
            : PreferredSize(
                preferredSize: Size(screenSize.width, 1000),
                child: NavBar(),
              ),
        drawer: MobileMenu(),
        backgroundColor: bgColor,
        body: ResponsiveWidget(
          largeScreen: DesktopScreen(),
          smallScreen: MobileScreen(),
        ));
  }
}
