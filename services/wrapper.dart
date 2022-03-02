import 'package:flutter/material.dart';
import 'package:flutter_web_example/Home/home/home.dart';
import 'package:flutter_web_example/generated_plugin_registrant.dart';
import 'package:flutter_web_example/moels/user.dart';
import 'package:flutter_web_example/ui/registerpage/register_page_left_side.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserModel>(context);

    if (user == null) {
      return RegisterPageLeftSide();
    }
    return HomePage();
  }
}
