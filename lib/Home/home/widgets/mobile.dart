import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_web_example/home/widgets/button.dart';
import 'package:flutter_web_example/home/constants/content.dart';
import 'package:flutter_web_example/home/helpers/responsive.dart';
import 'package:flutter_web_example/home/helpers/style.dart';
import 'package:flutter_web_example/home/widgets/button.dart';

class MobileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [TexteTitle()],
        ),
        SizedBox(
          height: 50,
        ),
        Container(
          width: 550,
          constraints: BoxConstraints(maxWidth: 550),
          child: Text(
            mainParagraph,
            textAlign: TextAlign.center,
            style: GoogleFonts.roboto(letterSpacing: 1.5, height: 1.5),
          ),
        ),
        SizedBox(
          height: 20,
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
                    offset: Offset(0, 40),
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
                      hintText: "Email",
                      border: InputBorder.none),
                ),
              ),
              CustomButton(
                text: "Get started",
              )
            ],
          ),
        ),
      ],
    );
  }
}

class TexteTitle extends StatelessWidget {
  const TexteTitle({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      width: 450,
      child: DefaultTextStyle(
        style: TextStyle(),
        child: AnimatedTextKit(
          animatedTexts: [
            TypewriterAnimatedText(
                "เว็บไซร์ระบบสาระสนเทศ\nวิชาโครงานและวิชาโครงการ\nแผนกวิชาเทคโนโลยีธุรกิจดิจิทัจ",
                textStyle: TextStyle(
                    color: active,
                    fontSize:
                        ResponsiveWidget.isMediumScreen(context) ? 30 : 35,
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
