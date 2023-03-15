import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lostandfound/CRUD/c2.dart';

class OrderDisplayback extends StatefulWidget {
  OrderDisplayback({
    super.key,
  });

  @override
  State<OrderDisplayback> createState() => _OrderDisplaybackState();
}

class _OrderDisplaybackState extends State<OrderDisplayback> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,

      body: StreamBuilder(
        builder: (context,
            AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.active:
              return ListView.builder(
                itemBuilder: (context, index) {
                  return OrderDisplayy(
                    snap: snapshot.data!.docs[index].data(),
                  );
                },
                itemCount: snapshot.data!.docs.length,
              );
          }
          return const CircularProgressIndicator();
        },
        stream: FirebaseFirestore.instance
            .collection("item")
            .where("userId", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
            .snapshots(),
      ),

      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
