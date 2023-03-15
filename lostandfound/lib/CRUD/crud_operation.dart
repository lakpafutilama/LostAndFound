import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

Future create({
  required String category,
  required String description,
  required String date,
  required String types,
  required String orderId,
}) async {
  final docItem = FirebaseFirestore.instance.collection('item').doc();
  final json = {
    'category': category,
    'description': description,
    'date': date,
    'type': types,
  };
  await docItem.set(json);
  return 'Posted';
}

class Button extends StatefulWidget {
  const Button({super.key});

  @override
  _ButtonState createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
// text fields' controllers

  final CollectionReference _products =
      FirebaseFirestore.instance.collection('products');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('item'),
      ),
      body: SafeArea(
        child: SizedBox(
          height: 500,
          child: StreamBuilder(
            stream:
                FirebaseFirestore.instance.collection('products').snapshots(),
            builder: (context,
                AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return const CircularProgressIndicator();
                default:
                  return ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      final snap = snapshot.data!.docs[index].data();
                      return Card(
                          margin: const EdgeInsets.all(5),
                          child: ListTile(
                            title: Text(snap['petName']),
                            subtitle: Text(snap['price'].toString()),
                            trailing: SizedBox(
                              width: 100,
                              child: Row(children: [
                                IconButton(
                                  icon: const Icon(Icons.delete),
                                  onPressed: () async {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                            content:
                                                Text("Successfully deleted")));
                                    await FirebaseFirestore.instance
                                        .collection('item')
                                        .doc(snap['productId'])
                                        .delete();
                                  },
                                ),
                              ]),
                            ),
                          ));
                    },
                  );
              }
            },
          ),
        ),
      ),
    );
  }
}
