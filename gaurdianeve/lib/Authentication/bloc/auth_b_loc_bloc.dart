import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'auth_b_loc_event.dart';
part 'auth_b_loc_state.dart';

class AuthBLocBloc extends Bloc<AuthBLocEvent, AuthBLocState> {
  AuthBLocBloc() : super(AuthBLocInitial()) {
    on<AuthBLocEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}


