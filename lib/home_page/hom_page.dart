import 'dart:io';

import 'package:firebase_firestore/firestore/utils.dart';
import 'package:firebase_firestore/storage/utils.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  XFile? image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        widget.title,
      )),
      body: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              image == null
                  ? const Text(
                      "No picture",
                      style:
                          TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                    )
                  : Image.file(
                      File(image!.path),
                      height: 400,
                    ),
              ElevatedButton(
                  onPressed: () {
                    ImagePicker()
                        .pickImage(source: ImageSource.camera)
                        .then((value) {
                      var temp = value;
                      if (temp == null) {
                        return;
                      }
                      setState(() {
                        image = temp;
                      });
                    });
                  },
                  child: const Text("Take picture")),
              ElevatedButton(
                  onPressed: () {
                    UploadTask uploadTask =
                        StorageUtils.uploadFile(File(image!.path));
                    uploadTask.then((TaskSnapshot success) {
                      print("$success");
                      success.ref.getDownloadURL().then((value) {
                        print(value);
                        FireStoreUtils.pushData("image", {"link": value});
                      });
                    }, onError: (error) {
                      print("$error");
                    });
                  },
                  child: Text("upload"))
            ],
          )),
    );
  }
}
