import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:gaurdianeve/model/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_b_loc_event.dart';
part 'auth_b_loc_state.dart';

final firebase = FirebaseAuth.instance;

class AuthBLocBloc extends Bloc<AuthBLocEvent, AuthBLocState> {
  AuthBLocBloc() : super(Unauthenticated()) {
    on<LoginEvent>((event, emit) async {
      emit(Loading());
      Future.delayed(Duration(seconds: 3));
      try {
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
      } catch (e) {
        if (e is FirebaseAuthException) {
          print(e.code);
          switch (e.code) {
            case 'user-not-found':
              emit(AuthenticationError('User not found'));
              break;
            case 'invalid-credential':
              emit(AuthenticationError('Wrong Info!'));
              break;
            case 'invalid-email':
              emit(AuthenticationError("Invalid User"));
              break;
            default:
              emit(AuthenticationError('Authentication error: ${e.message}'));
          }
        } else {
          emit(AuthenticationError('Unknown error occurred'));
        }
      }
    });

    on<CreateUser>((event, emit) async {
      emit(Loading());
      Future.delayed(Duration(seconds: 3));
      try {
        final UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: event.email, password: event.password);
      if (userCredential.user != null) {
        final userID = userCredential.user!.uid;
        final user = userCredential.user;
        FirebaseMessaging messaging = FirebaseMessaging.instance;
        final token = await messaging.getToken();
        user?.updatePhotoURL("avatar1");
        final db = FirebaseFirestore.instance;
        DocumentReference docRef = db.collection('users').doc(userID);
        docRef.set({
          "id": user!.uid,
          "email": user!.email,
          "username": event.username,
          "avatarUrl": "avatar1",
          "token": token
        });
        final UserProfile currentUser = UserProfile(
            user.uid, user.photoURL ?? "avatar1", event.username, user.email!);
        print("succesfully created User");

        emit(Authenticated(currentUser));
      }
      } catch (e) {
        if (e is FirebaseAuthException) {
          print(e.code);
          switch (e.code) {
            case 'email-already-in-use':
              emit(AuthenticationError("Account Already Existed"));
              break;
            default:
              emit(AuthenticationError('Authentication error: ${e.code}'));
          }
        } else {
          emit(AuthenticationError('Unknown error occurred'));
        }
        
      }
    });
    on<UpdatingUser>((event, emit) {
      final userId = FirebaseAuth.instance.currentUser?.uid;
      final db = FirebaseFirestore.instance;
      DocumentReference docRef = db.collection('users').doc(userId);
      docRef
          .update({"username": event.user.username, "email": event.user.email});
      emit(Authenticated(UserProfile(event.user.id, event.user.avatarURL,
          event.user.username, event.user.email)));
    });

    on<SignOut>((event, emit) {
      SharedPreferences.getInstance().then((prefs) {
              prefs.setBool('isLoggedIn', false);
            });
      FirebaseAuth.instance.signOut();
      emit(Unauthenticated());
    });
    on<CheckLogging>((event, emit) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
      final user = await FirebaseAuth.instance.authStateChanges().first;

      if (isLoggedIn) {
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
          emit(Unauthenticated());
        }
      } else {
        emit(Unauthenticated());
      }
    });
  }
}
