import 'package:flutter/material.dart';
import 'package:lostandfound/screenUI/search_screen.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: const Icon(Icons.menu),
          title: const Text("Home"),
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: Colors.greenAccent,
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Search()));
              },
            ),
          ]),
      body: SingleChildScrollView(
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                // Show lost items
              },
              child: Container(
                height: 200,
                color: Colors.green,
                child: const Center(
                  child: Text(
                    'LOST',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
              width: MediaQuery.of(context).size.width,
            ),
            GestureDetector(
              onTap: () {
                //Show found items
              },
              child: Container(
                height: 200,
                color: Colors.green,
                child: const Center(
                  child: Text(
                    'FOUND',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
