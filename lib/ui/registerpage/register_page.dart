import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_web_example/ui/pages/login_page_right_side.dart';
import 'package:flutter_web_example/ui/registerpage/register_page_left_side.dart';
import 'package:flutter_web_example/ui/pages/login_page_left_side.dart';

class Registerpage extends StatelessWidget {
  const Registerpage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF2F4Fc),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            height: 640,
            width: 1080,
            margin: const EdgeInsets.symmetric(horizontal: 24),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(32),
              color: Colors.white,
            ),
            child: Row(
              children: [
                const RegisterPageLeftSide(),
                if (MediaQuery.of(context).size.width > 900)
                  const LoginPageRightSide(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
