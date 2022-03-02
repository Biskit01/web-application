import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_example/Home/widgets/text_field_input.dart';
import 'package:flutter_web_example/moels/user.dart';
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
/*class RegisterPageLeftSide extends StatefulWidget {
  const RegisterPageLeftSide({Key key}) : super(key: key);

  @override
  _RegisterPageLeftSideState createState() => _RegisterPageLeftSideState();
}

class _RegisterPageLeftSideState extends State<RegisterPageLeftSide> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController idStudent = TextEditingController();
  TextEditingController password = TextEditingController();

  
  create() async {
    final firebase = FirebaseFirestore.instance;
    try {
      await firebase.collection("user").doc().set({
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
                  create();
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
}*/

class RegisterPageLeftSide extends StatefulWidget {
  const RegisterPageLeftSide({Key key}) : super(key: key);

  @override
  _RegisterPageLeftSideState createState() => _RegisterPageLeftSideState();
}

class _RegisterPageLeftSideState extends State<RegisterPageLeftSide> {
  //TextEditingController name = TextEditingController();
  //TextEditingController email = TextEditingController();
  //TextEditingController idStudent = TextEditingController();
  //TextEditingController password = TextEditingController();
  TextEditingController nameController;
  TextEditingController emailController;
  TextEditingController idStudentController;
  TextEditingController passwordController;
  FirebaseAuth auth = FirebaseAuth.instance;
  final AuthService _authService = AuthService();

  String email = '';
  String password = '';
  String name = '';
  String idStudent = '';
  /*create() async {
    final firebase = FirebaseFirestore.instance;
    try {
      await firebase.collection("user").doc().set({
        "name ": name.text,
        "emil": email.text,
        "idStudent": idStudent.text,
        "password": password.text,
      });
    } catch (e) {
      print(e);
    }
  }
*/

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
                //controller: idStudentController,
                onChanged: (val) => setState(() {
                  idStudent = val;
                }),
                decoration: InputDecoration(
                    label: (Text("รหัสนักศึกษา")),
                    hintText: "PLease write your email address"),
              ),
              TextField(
                //controller: nameController,
                onChanged: (val) => setState(() {
                  name = val;
                }),
                decoration: const InputDecoration(
                    label: (Text("ชื่อ - นามสกุล")),
                    hintText: "PLease write your email passsword"),
              ),
              TextField(
                //controller: emailController,
                onChanged: (val) => setState(() {
                  email = val;
                }),
                decoration: const InputDecoration(
                    label: (Text("emil")),
                    hintText: "PLease write your email password"),
              ),
              TextField(
                //controller: passwordController,
                onChanged: (val) => setState(() {
                  password = val;
                }),
                decoration: const InputDecoration(
                    label: (Text("password")),
                    hintText: "PLease write your email passsword"),
              ),
              const SizedBox(height: 24),
              const SizedBox(height: 24),
              MaterialButton(
                onPressed: () {
                  // create();
                  //name.clear();
                  //email.clear();
                  // idStudent.clear();
                  //password.clear()

                  _authService.signUn(email, password);
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

//เป็นเหี้่ยไรมากมะไอ้สัส
class AuthService {
  FirebaseAuth auth = FirebaseAuth.instance;
  // Before
  UserModel _userFromFirebaseUser(User user) {
    return user != null ? UserModel(id: user.uid) : null;
  }

  Stream<UserModel> get user {
    return auth.authStateChanges().map(_userFromFirebaseUser);
  }

  Future signUn(email, password) async {
    try {
      User user = (await auth.createUserWithEmailAndPassword(
          email: email, password: password)) as User;

      _userFromFirebaseUser(user);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('aaaaaaaa');
      } else if (e.code == 'email -aarrr') {
        print("ggae");
      }
    } catch (e) {
      print(e);
    }
  }

  Future sigIn(email, password) async {
    try {
      User user = (await auth.signInWithEmailAndPassword(
          email: email, password: password)) as User;

      _userFromFirebaseUser(user);
    } on FirebaseAuthException catch (e) {
      print(e);
    } catch (e) {
      print(e);
    }
  }
}

/*class SavePost {
  Future register(Text) async {
    await FirebaseFirestore.instance.collection("user").add({
      'text ': text,
      'creator': FirebaseAuth.instance.currentUser.uid,
      'timestamp': FieldValue.serverTimestamp(),
    });
  }
}*/

/*class RegisterPageLeftSide extends StatefulWidget {
  const RegisterPageLeftSide({Key key}) : super(key: key);

  @override
  _RegisterPageLeftSideState createState() => _RegisterPageLeftSideState();
}

class _RegisterPageLeftSideState extends State<RegisterPageLeftSide> {
  TextEditingController firstNameEditingController = TextEditingController();
  TextEditingController lastNameEditingController = TextEditingController();
  TextEditingController passwordEditingController = TextEditingController();
  TextEditingController emailEditingController = TextEditingController();
  final AuthService _authService = AuthService();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  potDetailsTofirestore() async {
    //calling out firestore
    //calling our use model
    //sending these values
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    FirebaseAuth auth = FirebaseAuth.instance;

    User user = auth.currentUser;
    UserModel userModel = UserModel();
    // writing al1 the values
    userModel.email = user.email;
    userModel.uid = user.uid;
    userModel.firstName = firstNameEditingController.text;
    userModel.lastName = lastNameEditingController.text;

    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(userModel.toMap());
  }

  /* create() async {
    final firebase = FirebaseFirestore.instance;
    try {
      await firebase.collection("user").doc().set({
        "name ": name.text,
        "emil": email.text,
        "idStudent": idStudent.text,
        "password": password.text,
      });
    } catch (e) {
      print(e);
    }
  }*/

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(80.0),
          child: Column(
            key: _formKey,
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
                controller: firstNameEditingController,
                decoration: InputDecoration(
                    label: (Text("รหัสนักศึกษา")),
                    hintText: "PLease write your email address"),
              ),
              TextField(
                controller: lastNameEditingController,
                decoration: const InputDecoration(
                    label: (Text("ชื่อ - นามสกุล")),
                    hintText: "PLease write your email passsword"),
              ),
              TextField(
                controller: emailEditingController,
                decoration: const InputDecoration(
                    label: (Text("emil")),
                    hintText: "PLease write your email password"),
              ),
              TextField(
                controller: passwordEditingController,
                decoration: const InputDecoration(
                    label: (Text("password")),
                    hintText: "PLease write your email passsword"),
              ),
              const SizedBox(height: 24),
              const SizedBox(height: 24),
              MaterialButton(
                onPressed: () {
                  //create();
                  //name.clear();
                  //email.clear();
                  //idStudent.clear();
                  //password.clear();
                  potDetailsTofirestore();
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

class Register {
  final String name;
  final String email;
  final String password;
  final String idStudent;
  Register({
    this.name,
    this.email,
    this.password,
    this.idStudent,
  });
  // receiving data from server
  /*factory Register.fromMap(map) {
    return Register(
      name: map['name'],
      email: map['email'],
      idStudent: map['idStudent'],
      password: map['password'],
    );
  }*/
  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'fidStudent': idStudent,
      'password': password,
    };
  }
}

class registerButton extends StatelessWidget {
  const registerButton({
    Key key,
    @required this.nameController,
    @required this.emailController,
    @required this.idStudentController,
    @required this.passwordController,
  }) : super(key: key);
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController idStudentController;
  final TextEditingController passwordController;
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
