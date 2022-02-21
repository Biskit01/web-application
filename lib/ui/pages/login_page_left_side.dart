import 'package:flutter/material.dart';
import 'package:flutter_web_example/ui/registerpage/register_page.dart';
import 'package:flutter_web_example/ui/registerpage/register_page_left_side.dart';

class LoginPageLeftSide extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _posswordController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _posswordController.dispose();
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
                "Login",
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
                  label: (Text(
                    "Email",
                  )),
                  hintText: "PLease write your email address",
                ),
              ),
              const TextField(
                decoration: const InputDecoration(
                    label: (Text("password")),
                    hintText: "PLease write your email passsword"),
              ),
              const SizedBox(height: 24),
              Align(
                alignment: Alignment.topRight,
                child: MaterialButton(
                  child: const Text("Forget password"),
                  onPressed: () {},
                ),
              ),
              const SizedBox(height: 24),
              MaterialButton(
                onPressed: () {},
                child: const Text("Loing"),
                minWidth: double.infinity,
                height: 52,
                color: Colors.blueAccent.shade700,
                textColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32)),
              ),
              const SizedBox(height: 35),
              MaterialButton(
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) {
                    return Registerpage();
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
            ],
          ),
        ),
      ),
    );
  }
}
