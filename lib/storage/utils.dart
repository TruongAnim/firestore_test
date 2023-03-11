import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';

class StorageUtils {
  static UploadTask uploadFile(File _photo, {name}) {
    print(_photo.path);
    final storage = FirebaseStorage.instanceFor(
        bucket: "gs://testfirebase-46448.appspot.com");
    final fileName = name ?? basename(_photo.path);
    // Reference ref = FirebaseStorage.instance.ref("images");
    Reference ref = storage.ref('images');
    // ref.child(fileName).putFile(_photo).then((result) {
    //   print("result: $result");
    // });

    // UploadTask task = ref.child(fileName).putFile(_photo);
    // task.whenComplete(() => print("Done"));

    UploadTask task = ref.child(fileName).putFile(_photo);
    return task;

    // ref.child(fileName).putFile(_photo).then((TaskSnapshot snapshot) {
    //   print("result: ${snapshot.state}");
    // });
  }
}
