import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserData {
  static Future<String?> getUserName() async {
    String? name = "";
    var uid = FirebaseAuth.instance.currentUser!.uid;
    await FirebaseFirestore.instance
        .collection("userData")
        .doc(uid)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        print("user Name is ${documentSnapshot["fullName"]}");
        name = documentSnapshot["fullName"];
      }
    });
    return name;
  }
}
