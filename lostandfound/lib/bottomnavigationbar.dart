// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:lostandfound/screenUI/home_screen.dart';
import 'package:lostandfound/screenUI/profile_screen.dart';
import 'package:lostandfound/widgets/card_widget.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key, required this.orderId});
  String? orderId;

  // const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _BottomNavigationbarState();
}

class _BottomNavigationbarState extends State<HomePage> {
  final pages = [
    const Home(),
    const Profile(),
  ];
  var currentindex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.yellowAccent,
          backgroundColor: Colors.greenAccent.withOpacity(0.8),
          currentIndex: currentindex,
          onTap: (index) {
            setState(() {
              currentindex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Profile",
            ),
          ]),
      body: pages[currentindex],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        // isExtended: true,
        backgroundColor: Colors.yellowAccent,
        foregroundColor: Colors.green,
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const MyCardWidget()));
        },
        isExtended: true,
        child: const Icon(Icons.add),
      ),
    );
  }
}
