import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'dart:async';

class UserModel extends Model {

  FirebaseAuth auth = FirebaseAuth.instance;
   User? user;
  Map<String, dynamic> userData = Map();
   //usuario atual
  bool isLoading = false;

  void signUp({required Map<String, dynamic> userData, required String pass,
      required VoidCallback onSuccess, required VoidCallback onFail}){
    isLoading = true;
    notifyListeners();

    auth.createUserWithEmailAndPassword(
        email: userData["email"],
        password: pass
    ).then((user) async {
      user = user;

      await _saveUserData(userData);

      onSuccess();
      isLoading = false;
      notifyListeners();
    }).catchError((e){
      onFail();
      isLoading = false;
      notifyListeners();
    });

  }

  void singIn() async{
    isLoading = true;
    notifyListeners();

    await Future.delayed(Duration(seconds: 5));

    isLoading = false;
    notifyListeners();

  }

  void recoverPass(){

  }
  Future<Null> _saveUserData(Map<String, dynamic> userData) async{
    this.userData = userData;
    FirebaseFirestore.instance.collection('users').doc(user!.uid).set(userData);

// bool? isLoggedIn(){

  }
}