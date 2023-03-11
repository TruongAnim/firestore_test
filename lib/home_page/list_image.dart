import 'package:firebase_firestore/models/image_model.dart';
import 'package:firebase_firestore/utils.dart';
import 'package:flutter/material.dart';

class ListImage extends StatefulWidget {
  const ListImage({super.key});

  @override
  State<ListImage> createState() => _ListImageState();
}

class _ListImageState extends State<ListImage> {
  List<ImageModel> images = [
    ImageModel(
        name: "image1",
        link:
            "https://firebasestorage.googleapis.com/v0/b/testfirebase-46448.appspot.com/o/images%2Fd02463b3-3e69-4076-81db-873421c5cdb53269158581218009833.jpg?alt=media&token=05962755-2eff-4630-a89e-8e2d9ade1236"),
    ImageModel(
        name: "image2",
        link:
            "https://firebasestorage.googleapis.com/v0/b/testfirebase-46448.appspot.com/o/images%2Fffed98db-bfa9-46c3-a0c8-9454007c84178836373938840127255.jpg?alt=media&token=1bf03430-a029-4fd6-86e3-81c9cd2cde13"),
    ImageModel(
        name: "image3",
        link:
            "https://firebasestorage.googleapis.com/v0/b/testfirebase-46448.appspot.com/o/images%2F90a5044b-21cf-4d1d-a7e5-163b13cde8378206016369583689638.jpg?alt=media&token=92659baf-c6cd-4cae-8e39-df627fc17772"),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: ListView.builder(
        itemCount: images.length,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
                color: index % 2 == 0 ? Colors.green[300] : Colors.green[100],
                borderRadius: BorderRadius.circular(15)),
            padding: EdgeInsets.symmetric(vertical: 5),
            margin: EdgeInsets.symmetric(vertical: 10),
            child: ListTile(
              title: Text(
                images[index].name,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              subtitle: Text(Utils.ellipsisText(images[index].link, 30),
                  style: TextStyle(fontSize: 16)),
              leading: Image.network(images[index].link),
            ),
          );
        },
      ),
    );
  }
}
