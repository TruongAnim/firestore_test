import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_firestore/models/image_model.dart';
import 'package:firebase_firestore/utils.dart';
import 'package:flutter/material.dart';

class ListImage extends StatefulWidget {
  String collection;
  ListImage({super.key, required this.collection});

  @override
  State<ListImage> createState() => _ListImageState();
}

class _ListImageState extends State<ListImage> {
  Stream<QuerySnapshot>? stream;
  @override
  void initState() {
    stream = FirebaseFirestore.instance.collection("images").snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: stream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text("Loading");
          }
          var docs = snapshot.data!.docs;
          print("docs: ${docs.length}");
          return Container(
            margin: const EdgeInsets.only(top: 10),
            child: ListView.builder(
              itemCount: docs.length,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                      color: index % 2 == 0
                          ? Colors.green[300]
                          : Colors.green[100],
                      borderRadius: BorderRadius.circular(15)),
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: ListTile(
                    title: Text(
                      docs[index]["name"],
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    subtitle: Text(Utils.ellipsisText(docs[index]["link"], 30),
                        style: const TextStyle(fontSize: 16)),
                    leading: Image.network(docs[index]["link"]),
                  ),
                );
              },
            ),
          );
        });
  }
}

class UserInformation extends StatefulWidget {
  @override
  _UserInformationState createState() => _UserInformationState();
}

class _UserInformationState extends State<UserInformation> {
  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('users').snapshots();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _usersStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }

        return ListView(
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
            Map<String, dynamic> data =
                document.data()! as Map<String, dynamic>;
            return ListTile(
              title: Text(data['full_name']),
              subtitle: Text(data['company']),
            );
          }).toList(),
        );
      },
    );
  }
}
