import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_firestore/firestore/utils.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

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
                    FireStoreUtils.uploadFile(File(image!.path));
                  },
                  child: Text("upload"))
            ],
          )),
    );
  }
}
