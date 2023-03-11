import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreUtils {
  static Future<void> pushData(String collection, Map<String, dynamic> data) {
    CollectionReference collecInstance =
        FirebaseFirestore.instance.collection(collection);
    // Call the user's CollectionReference to add a new user
    return collecInstance
        .add(data)
        .then((value) => print("Push link to firestore"))
        .catchError((error) => print("Failed to push link: $error"));
  }
}
