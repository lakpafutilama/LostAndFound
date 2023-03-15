// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lostandfound/bottomnavigationbar.dart';

class OrderDisplayy extends StatefulWidget {
  const OrderDisplayy({super.key, required this.snap});
  final snap;

  @override
  State<OrderDisplayy> createState() => _OrderDisplayyState();
}

class _OrderDisplayyState extends State<OrderDisplayy> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(children: [
      Container(
        alignment: Alignment.center,
        height: 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          // color: Color.fromARGB(62, 33, 27, 196)
        ),
        width: 300,
        child: Text(
          "Category",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
      ),
      SizedBox(
        height: 10,
      ),
      Divider(),
      SizedBox(
        height: 20,
      ),
      Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: Text(
                "Category: ${widget.snap['category']}",
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
              ),
            ),
            Container(
              child: Text(
                "Date: ${widget.snap['date']}",
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
              ),
            ),
            Container(
              child: Text(
                "Description: ${widget.snap['description']}",
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
              ),
            ),
            Container(
              child: Text(
                "Type : ${widget.snap['type']}",
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
              ),
            ),
          ]),
      SizedBox(
        height: 10,
      ),
      Column(
        children: [
          Container(
            height: 100,
            width: 110,
            child: Column(children: [
              InkWell(
                child: Icon(Icons.edit),
                onTap: () {
                  String? orderId = widget.snap['orderId'];
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => HomePage(
                      orderId: orderId,
                    ),
                  ));
                },
              ),
              IconButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text("Order Delete?"),
                            content: Text(
                                "Do you want to delete the selected  Order"),
                            actions: <Widget>[
                              TextButton(
                                child: Text("Yes"),
                                onPressed: () async {
                                  Navigator.of(context).pop();
                                  await FirebaseFirestore.instance
                                      .collection('item')
                                      .doc(FirebaseAuth
                                          .instance.currentUser!.uid)
                                      .delete();
                                  // ignore: use_build_context_synchronously
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content:
                                              Text("Deleted successfully")));
                                },
                              ),
                              TextButton(
                                child: Text("No"),
                                onPressed: () async {
                                  Navigator.of(context).pop();
                                },
                              )
                            ],
                          );
                        });
                  },
                  icon: Icon(Icons.delete)),
            ]),
          ),
          Divider(
            height: 5,
          )
        ],
      ),
    ]));
  }
}
