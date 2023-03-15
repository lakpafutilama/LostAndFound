import 'package:flutter/material.dart';
import 'package:lostandfound/screenUI/add_founditem.dart';
import 'package:lostandfound/screenUI/add_lostitem.dart';

class MyCardWidget extends StatelessWidget {
  const MyCardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      width: 300,
      height: 200,
      padding: const EdgeInsets.all(10.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: Colors.yellow.shade200,
        elevation: 10,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const ListTile(
              title: Text('What do you want to add?',
                  style: TextStyle(fontSize: 20.0)),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AddLostItem()));
              },
              child: const ListTile(
                leading: Icon(Icons.add_box_rounded, size: 20),
                title: Text('Add Lost item',
                    style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.greenAccent)),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AddFoundItem(
                              orderId: '',
                            )));
              },
              child: const ListTile(
                leading: Icon(Icons.add_box_rounded, size: 20),
                title: Text('Add found item',
                    style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.greenAccent)),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
