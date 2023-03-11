import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';

class FireStoreUtils {
  static void uploadFile(File _photo) {
    if (_photo == null) return;
    print(_photo.path);
    final storage = FirebaseStorage.instanceFor(
        bucket: "gs://testfirebase-46448.appspot.com");
    final fileName = basename(_photo.path);
    // Reference ref = FirebaseStorage.instance.ref("images");
    Reference ref = storage.ref('images');
    // ref.child(fileName).putFile(_photo).then((result) {
    //   print("result: $result");
    // });

    // UploadTask task = ref.child(fileName).putFile(_photo);
    // task.whenComplete(() => print("Done"));

    UploadTask task = ref.child(fileName).putFile(_photo);
    task.then((TaskSnapshot success) {
      print("$success");
    }, onError: (error) {
      print("$error");
    });

    // ref.child(fileName).putFile(_photo).then((TaskSnapshot snapshot) {
    //   print("result: ${snapshot.state}");
    // });
  }
}
