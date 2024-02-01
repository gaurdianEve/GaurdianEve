import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:meta/meta.dart';
import 'package:firebase_auth/firebase_auth.dart';



part 'auth_b_loc_event.dart';
part 'auth_b_loc_state.dart';


class AuthBLocBloc extends Bloc<AuthBLocEvent, AuthBLocState> {
  AuthBLocBloc() : super(AuthBLocInitial()) {
    on<LoginEvent>((event, emit) {
      final firebase = FirebaseAuth.instance;
      firebase.signInWithEmailAndPassword(email: "sarvarsheikh891@gmail.com", password: "");
    });
  }
}


