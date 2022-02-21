import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_web_example/home/helpers/responsive.dart';
import 'package:flutter_web_example/home/helpers/style.dart';
import 'package:flutter_web_example/home/widgets/button.dart';
import 'package:flutter_web_example/ui/pages/login_page.dart';

class NavBar extends StatefulWidget {
  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  final List _isHovering = [
    false,
    false,
  ];

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return PreferredSize(
      preferredSize: Size(screenSize.width, 1000),
      child: Container(
        color: Colors.transparent,
        child: Padding(
          padding: EdgeInsets.only(
              left: ResponsiveWidget.isLargeScreen(context) ? 150 : 100,
              right: ResponsiveWidget.isLargeScreen(context) ? 150 : 100),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 20,
              ),
              Image.asset("assets/images/logo.png"),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(width: screenSize.width / 8),
                    InkWell(
                      onHover: (value) {
                        setState(() {
                          value
                              ? _isHovering[0] = true
                              : _isHovering[0] = false;
                        });
                      },
                      hoverColor: Colors.transparent,
                      onTap: () {},
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                      ),
                    ),
                    Container(
                      constraints: BoxConstraints(maxWidth: 550),
                      padding: EdgeInsets.all(4),
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(40),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(.1),
                                offset: Offset(0, 0),
                                blurRadius: 80)
                          ]),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: screenSize.width / 4,
                            padding: EdgeInsets.only(left: 4),
                            child: TextField(
                              decoration: InputDecoration(
                                  icon: Icon(Icons.email_outlined),
                                  hintText: "ค้นหาโครงาน",
                                  border: InputBorder.none),
                            ),
                          ),
                          CustomButton(
                            text: "ค้นหา",
                          )
                        ],
                      ),
                    ),
                    SizedBox(width: screenSize.width / 20),
                    InkWell(
                      onHover: (value) {
                        setState(() {
                          value
                              ? _isHovering[1] = true
                              : _isHovering[1] = false;
                        });
                      },
                      hoverColor: Colors.transparent,
                      onTap: () {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) {
                          return Loginpage();
                        }));
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            height: 12,
                          ),
                          Text(
                            'Log In',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: _isHovering[1] ? active : disable,
                            ),
                          ),
                          SizedBox(height: 5),
                          Visibility(
                            maintainAnimation: true,
                            maintainState: true,
                            maintainSize: true,
                            visible: _isHovering[1],
                            child: Container(
                              decoration: BoxDecoration(
                                  color: active,
                                  borderRadius: BorderRadius.circular(20)),
                              height: 7,
                              width: 7,
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(width: screenSize.width / 20),
                  ],
                ),
              ),
              CustomButton(
                text: "Register",
              ),
              SizedBox(width: screenSize.width / 40),
            ],
          ),
        ),
      ),
    );
  }
}
