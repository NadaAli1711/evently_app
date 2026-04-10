import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../models/app_user.dart';
class AuthUtils {

  static Future<AppUser?> register({required String emailAddress , required String password,required String name,})async{
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      AppUser newUser = AppUser(uId: credential.user!.uid,name: name,email: emailAddress,);
      var collection = FirebaseFirestore.instance.collection(AppUser.collectionName);
      await collection.doc(newUser.uId).set(newUser.toFireStore());
      return newUser;

    } on FirebaseAuthException catch (e) {

      print("Firebase Auth Error: ${e.code}");

      throw e;
    }
  }
  static Future<AppUser?> login({required String emailAddress , required String password})async{
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailAddress,
          password: password
      );
      var collection = FirebaseFirestore.instance.collection(AppUser.collectionName);
      var doc = await collection.doc(credential.user!.uid).get();

      return AppUser.fromFireStore(doc.data());
    } on FirebaseAuthException catch (e) {

      print("Firebase Auth Error: ${e.code}");

      throw e;
    }
  }
  static Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
  }
}