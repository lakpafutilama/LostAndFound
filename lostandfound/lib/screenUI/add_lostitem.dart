import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lostandfound/CRUD/c1.dart';
import 'package:lostandfound/reusable_widgets/reusable_widgets.dart';
import 'package:lostandfound/screenUI/profile_screen.dart';
import 'package:uuid/uuid.dart';

import '../CRUD/crud_operation.dart';

class AddLostItem extends StatefulWidget {
  const AddLostItem({super.key});
  @override
  State<AddLostItem> createState() => _AddLostItemState();
}

class _AddLostItemState extends State<AddLostItem> {
  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false,
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        elevation: 0,
        title: const Text(
          "Add Lost Item Details",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: <Widget>[
          Form(
            // key: _formKey,
            child: Column(
              children: <Widget>[
                const Text(
                  'Lost Something?\n',
                  style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                Row(
                  children: <Widget>[
                    // ignore: unnecessary_new
                    new Container(
                      height: 200.0,
                      width: 200.0,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.greenAccent),
                      ),
                      padding: const EdgeInsets.all(5.0),
                      // child: image == null ? const Text('Add') : Image.file(),
                    ),
                    const Divider(),
                    IconButton(
                        icon: const Icon(Icons.camera_alt), onPressed: () {}),
                    const Divider(),
                    IconButton(icon: const Icon(Icons.image), onPressed: () {}),
                  ],
                ),
                SizedBox(
                  height: 10,
                  width: MediaQuery.of(context).size.width,
                ),
                textfield("Enter item category", false, _categoryController),
                SizedBox(
                  height: 10,
                  width: MediaQuery.of(context).size.width,
                ),
                textfield("Enter description", false, _descriptionController),
                SizedBox(
                  height: 10,
                  width: MediaQuery.of(context).size.width,
                ),
                textfield("Lost Date", false, _dateController),
                SizedBox(
                  height: 10,
                  width: MediaQuery.of(context).size.width,
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              final category = _categoryController.text;
              final description = _descriptionController.text;
              final date = _dateController.text;
              const types = "lost";
              String orderIds = Uuid().v1();
              FirebaseFirestore.instance
                  .collection('item')
                  .doc(FirebaseAuth.instance.currentUser!.uid)
                  .set({
                'category': category,
                'description': description,
                'date': date,
                'type': types,
                'orderId': orderIds,
                'userId': FirebaseAuth.instance.currentUser!.uid,
              });
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => OrderDisplayback()));
            },
            child: const Text('Post', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
