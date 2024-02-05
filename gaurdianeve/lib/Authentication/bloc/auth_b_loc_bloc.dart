

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gaurdianeve/model/user.dart';

part 'auth_b_loc_event.dart';
part 'auth_b_loc_state.dart';

final firebase = FirebaseAuth.instance;
class AuthBLocBloc extends Bloc<AuthBLocEvent, AuthBLocState> {
  AuthBLocBloc() : super(Unauthenticated()) {
    on<LoginEvent>((event, emit) async{
      final UserCredential userCredential  = await firebase.signInWithEmailAndPassword(email: event.email, password: event.password);
      final user  =  userCredential.user ;
      print("in login");
      emit(Authenticated(UserProfile(user!.uid, user.photoURL??"null", user.email!, user.email!)));
    });
  }
}

Future<User?> loginUser(email,password)async{
  final UserCredential userCredential  = await firebase.signInWithEmailAndPassword(email: email, password: password);
  return userCredential.user ;
  
}

Future<UserProfile> createUser(email,password,username)async{
 
  final db = FirebaseFirestore.instance;
  final UserCredential userCredential  = await firebase.createUserWithEmailAndPassword(email: email, password: password);
  final _currentUser =  userCredential.user;
  final UserProfile currentUser =  UserProfile(_currentUser!.uid,"",username,email);
  db.collection("USER").add(currentUser.toJson());
  return currentUser;

}