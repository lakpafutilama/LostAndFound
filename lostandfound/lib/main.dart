import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lostandfound/auth_screen/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const LostandFound());
}

class LostandFound extends StatelessWidget {
  const LostandFound({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green),
      home: const LoginScreen(),
    );
  }
}
