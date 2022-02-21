import 'dart:ui';

import 'package:flutter/material.dart';

class LoginPageRightSide extends StatelessWidget {
  const LoginPageRightSide({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomRight,
              end: Alignment.topLeft,
              colors: [
                Colors.blueAccent.shade700,
                Colors.cyanAccent,
              ],
            ),
            image: DecorationImage(
                image: AssetImage('assets/5.png'), fit: BoxFit.cover),
          ),
          child: Center(
            child: SizedBox(
              height: 500,
              width: 400,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 12.0, vertical: 175.0),
                child: Text(
                  'เว็บไซต์ระบบสาระสนเทศ\nวิชาโครงการและโครงการ\nแผนกวิชาเทคโนโลธุรกิจยีดิจิทัล',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          )),
    );
  }
}
