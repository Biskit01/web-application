import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_example/Home/helpers/responsive.dart';
import 'package:flutter_web_example/Home/helpers/style.dart';
import 'package:flutter_web_example/Home/home/widgets/mobile.dart';
import 'package:flutter_web_example/Home/widgets/drawer.dart';
import 'package:flutter_web_example/Home/widgets/navbar_desktop.dart';
import 'package:flutter_web_example/home/home/home.dart';
import 'package:flutter_web_example/moels/user.dart';
import 'package:flutter_web_example/ui/registerpage/register_page_left_side.dart';
import 'package:provider/provider.dart';

import 'Home/home/widgets/desktop.dart';
import 'Home/widgets/mobile_navbar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: 'AIzaSyAoV3ujYmQ2PGj2KbNtwZztRjM_qcP2pAI',
        appId: '1:87130382107:web:992a2c633b86a4efc53dbe',
        messagingSenderId: 'G-JMNDFFYN80',
        projectId: 'testweb-638e8',
        storageBucket: "testweb-638e8.appspot.com",
      ),
    );
  } else {
    await Firebase.initializeApp();
  }

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          if (snapshot.hasError) {}
          if (snapshot.connectionState == ConnectionState.done) {
            return StreamProvider<UserModel>.value(
              value: AuthService().user,
              child: MaterialApp(home: HomePage()),
            );
          }
        }

        /*Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Web',
      theme: ThemeData(visualDensity: VisualDensity.adaptivePlatformDensity),
      home: HomePage(),
    );
  }*/
        );
  }
}

/*class Wrapper extends StatelessWidget {
  const Wrapper({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserModel>(context);

    if (user == null) {
      return RegisterPageLeftSide();
    }
    //return MaterialApp(initialRoute: '/', routes: {'/': (context) => });
    return HomePage();
  }
}*/
