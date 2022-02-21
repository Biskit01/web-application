import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_example/ui/pages/login_page_left_side.dart';
import 'package:flutter_web_example/ui/pages/login_page.dart';

/*class REEegisterPageLeftSide extends StatelessWidget {
  const REEgisterPageLeftSide({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(80.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Register",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              const TextField(
                decoration: InputDecoration(
                    label: (Text("รหัสนักศึกษา")),
                    hintText: "PLease write your email address"),
              ),
              const TextField(
                decoration: const InputDecoration(
                    label: (Text("ชื่อ - นามสกุล")),
                    hintText: "PLease write your email passsword"),
              ),
              const TextField(
                decoration: const InputDecoration(
                    label: (Text("emil")),
                    hintText: "PLease write your email passsword"),
              ),
              const TextField(
                decoration: const InputDecoration(
                    label: (Text("password")),
                    hintText: "PLease write your email passsword"),
              ),
              const SizedBox(height: 24),
              const SizedBox(height: 24),
              MaterialButton(
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) {
                    return Loginpage();
                  }));
                },
                child: const Text("Register"),
                minWidth: double.infinity,
                height: 52,
                color: Colors.blueAccent.shade700,
                textColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32)),
              ),
              const SizedBox(height: 35),
            ],
          ),
        ),
      ),
    );
  }
}*/
class RegisterPageLeftSide extends StatefulWidget {
  const RegisterPageLeftSide({Key key}) : super(key: key);

  @override
  _RegisterPageLeftSideState createState() => _RegisterPageLeftSideState();
}

class _RegisterPageLeftSideState extends State<RegisterPageLeftSide> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController idStudent = TextEditingController();
  TextEditingController password = TextEditingController();
  final firebase = FirebaseFirestore.instance;
  register() async {
    try {
      await firebase.collection("/User").doc().set({
        "name ": name.text,
        "emil": email.text,
        "idStudent": idStudent.text,
        "password": password.text,
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(80.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Register",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              TextField(
                controller: idStudent,
                decoration: InputDecoration(
                    label: (Text("รหัสนักศึกษา")),
                    hintText: "PLease write your email address"),
              ),
              TextField(
                controller: name,
                decoration: const InputDecoration(
                    label: (Text("ชื่อ - นามสกุล")),
                    hintText: "PLease write your email passsword"),
              ),
              TextField(
                controller: email,
                decoration: const InputDecoration(
                    label: (Text("emil")),
                    hintText: "PLease write your email password"),
              ),
              TextField(
                controller: password,
                decoration: const InputDecoration(
                    label: (Text("password")),
                    hintText: "PLease write your email passsword"),
              ),
              const SizedBox(height: 24),
              const SizedBox(height: 24),
              MaterialButton(
                onPressed: () {
                  register();
                  name.clear();
                  email.clear();
                  idStudent.clear();
                  password.clear();
                },
                child: const Text("Register"),
                minWidth: double.infinity,
                height: 52,
                color: Colors.blueAccent.shade700,
                textColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32)),
              ),
              const SizedBox(height: 35),
            ],
          ),
        ),
      ),
    );
  }
}
