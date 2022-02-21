import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_web_example/home/constants/content.dart';
import 'package:flutter_web_example/home/helpers/responsive.dart';
import 'package:flutter_web_example/home/helpers/style.dart';
import 'package:flutter_web_example/home/widgets/bottom_text_widget.dart';
import 'package:flutter_web_example/home/widgets/button.dart';

class DesktopScreen extends StatelessWidget {
  const DesktopScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.only(
                left: ResponsiveWidget.isLargeScreen(context) ? 150 : 100,
                right: ResponsiveWidget.isLargeScreen(context) ? 150 : 10),
            width: screenSize.width / 1.8,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 100,
                  ),
                  SizedBoxx(),
                  SizedBox(
                    height: 20,
                  ),
                  Visibility(
                    child: Text(
                      mainParagraph,
                      style: TextStyle(
                          fontSize: 20, letterSpacing: 1.5, height: 1.5),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  NeumorphismPage(),
                ],
              ),
            ),
          ),
          Container(
            width: screenSize.width / 2.3,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    height: screenSize.width / 28,
                  ),
                  Image.asset(
                    "assets/images/img.png",
                    width: screenSize.width / 1.9,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SizedBoxx extends StatelessWidget {
  const SizedBoxx({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 1000,
      height: 200,
      child: DefaultTextStyle(
        style: TextStyle(),
        child: AnimatedTextKit(
          animatedTexts: [
            TypewriterAnimatedText(
                "เว็บไซร์ระบบสาระสนเทศ\nวิชาโครงานและวิชาโครงการ\nแผนกวิชาเทคโนโลยีธุรกิจดิจิทัจ",
                textStyle: TextStyle(
                    color: active,
                    fontSize:
                        ResponsiveWidget.isMediumScreen(context) ? 30 : 41,
                    fontWeight: FontWeight.bold),
                speed: Duration(milliseconds: 100)),
          ],
          onTap: () {
            print("Tap Event");
          },
        ),
      ),
    );
  }
}

class NeumorphismPage extends StatefulWidget {
  const NeumorphismPage({Key key}) : super(key: key);

  @override
  State<NeumorphismPage> createState() => _NeumorphismPageState();
}

class _NeumorphismPageState extends State<NeumorphismPage> {
  bool _isElevated = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 0, 300, 0),
      child: GestureDetector(
        onTap: () {
          setState(() {
            _isElevated = !_isElevated;
          });
        },
        child: AnimatedContainer(
          duration: const Duration(
            milliseconds: 200,
          ),
          width: 250,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.white54,
            borderRadius: BorderRadius.circular(850),
            boxShadow: _isElevated
                ? [
                    const BoxShadow(
                      color: Colors.grey,
                      offset: Offset(4, 4),
                      blurRadius: 15,
                      spreadRadius: 1,
                    ),
                    const BoxShadow(
                      color: Colors.white,
                      offset: Offset(-4, -4),
                      blurRadius: 15,
                      spreadRadius: 1,
                    ),
                  ]
                : null,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 12),
          child: Text(
            'ดูโครงการและโครงงาน',
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent),
          ),
        ),
      ),
    );
  }
}
