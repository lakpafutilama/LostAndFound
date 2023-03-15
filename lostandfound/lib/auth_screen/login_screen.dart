// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:lostandfound/auth_screen/auth_login.dart';
import 'package:lostandfound/bottomnavigationbar.dart';
import 'package:lostandfound/auth_screen/signup_screen.dart';
import '../reusable_widgets/reusable_widgets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(15, 25, 15, 0),
            child: Column(
              children: <Widget>[
                logoWidget("assets/images/lflogo.png"),
                SizedBox(
                  height: 30,
                  width: MediaQuery.of(context).size.width,
                ),
                const Text(
                  '"One place for all lost and found things"',
                  style: TextStyle(
                      color: Colors.green,
                      fontSize: 15,
                      fontStyle: FontStyle.italic),
                ),
                SizedBox(
                  height: 30,
                  width: MediaQuery.of(context).size.width,
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
                  true,
                  () async {
                    final message = await AuthService().login(
                      email: _emailTextController.text,
                      password: _passwordTextController.text,
                    );
                    // if (message!.contains('Success')) {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => HomePage(
                              orderId: '',
                            )));
                    // }
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(message.toString()),
                      ),
                    );
                  },
                ),
                signUpOption()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row signUpOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Don't have an account? ",
            style: TextStyle(color: Colors.black)),
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const SignUpScreen()));
          },
          child: const Text(
            "Sign Up",
            style: TextStyle(
                color: Colors.greenAccent, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
