// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:lostandfound/auth_screen/auth_login.dart';
import 'package:lostandfound/bottomnavigationbar.dart';

import '../reusable_widgets/reusable_widgets.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _userNameTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        elevation: 0,
        title: const Text(
          "Sign Up",
          style: TextStyle(
              fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 120, 20, 0),
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 20,
                ),
                textfield("Enter username", false, _userNameTextController),
                const SizedBox(
                  height: 20,
                ),
                textfield("Enter email", false, _emailTextController),
                const SizedBox(
                  height: 20,
                ),
                textfield("Enter password", true, _passwordTextController),
                const SizedBox(
                  height: 20,
                ),
                loginSignUpButton(
                  context,
                  false,
                  () async {
                    final message = await AuthService().registration(
                      email: _emailTextController.text,
                      password: _passwordTextController.text,
                    );
                    if (message!.contains('Success')) {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => HomePage(
                                orderId: '',
                              )));
                    }
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(message),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
