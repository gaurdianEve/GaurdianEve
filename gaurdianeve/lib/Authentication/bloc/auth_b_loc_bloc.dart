import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gaurdianeve/model/user.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

part 'auth_b_loc_event.dart';
part 'auth_b_loc_state.dart';

final firebase = FirebaseAuth.instance;

class AuthBLocBloc extends Bloc<AuthBLocEvent, AuthBLocState> {
  AuthBLocBloc() : super(Unauthenticated()) {
   


    on<LoginEvent>((event, emit) async {
      emit(Loading());
      final UserCredential userCredential =
          await firebase.signInWithEmailAndPassword(
              email: event.email, password: event.password);
      final user = userCredential.user;
      print("In login");
      final db = FirebaseFirestore.instance;
      DocumentReference docRef = db.collection('users').doc(user!.uid);
      DocumentSnapshot snapshot = await docRef.get();
      if (snapshot.exists) {
        final currentUser = UserProfile(
            snapshot.get("id"),
            snapshot.get("avatarUrl"),
            snapshot.get("username"),
            snapshot.get("email"));
        emit(Authenticated(currentUser));
        // Use currentUser object here
      } else {
        // Document does not exist
      }
    });

    on<CreateUser>((event, emit) async {
      emit(Loading());
      final UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: event.email, password: event.password);
      if (userCredential.user != null) {
        final userID = userCredential.user!.uid;
        final user = userCredential.user;
        user?.updatePhotoURL("default");
        final db = FirebaseFirestore.instance;
        DocumentReference docRef = db.collection('users').doc(userID);
        docRef.set({
          "id": user!.uid,
          "email": user!.email,
          "username": event.username,
          "avatarUrl": "default",
        });
        final UserProfile currentUser = UserProfile(
            user.uid, user.photoURL ?? "default", event.username, user.email!);
        print("succesfully created User");
        emit(Authenticated(currentUser));
      }
    });
  }
}
