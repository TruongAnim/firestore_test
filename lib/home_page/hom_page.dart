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
  TextEditingController controller = TextEditingController();
  String file_name = "";
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        widget.title,
      )),
      body: Container(
          padding: const EdgeInsets.all(10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              image == null
                  ? const Text(
                      "No picture",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    )
                  : Image.file(
                      File(image!.path),
                      width: 100,
                    ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 30),
                  alignment: Alignment.centerRight,
                  child: Column(
                    children: [
                      TextField(
                        onChanged: (value) {
                          file_name = value;
                          if (file_name.isEmpty) {
                            file_name = "Default";
                          }
                        },
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Enter Name',
                            hintText: 'Enter file Name'),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
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
                                if (image == null) {
                                  return;
                                }
                                UploadTask uploadTask = StorageUtils.uploadFile(
                                    File(image!.path),
                                    name: file_name);
                                uploadTask.then((TaskSnapshot success) {
                                  print("$success");
                                  success.ref.getDownloadURL().then((value) {
                                    print(value);
                                    FireStoreUtils.pushData("image",
                                        {"name": file_name, "link": value});
                                  });
                                }, onError: (error) {
                                  print("$error");
                                });
                              },
                              child: const Text("upload"))
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
