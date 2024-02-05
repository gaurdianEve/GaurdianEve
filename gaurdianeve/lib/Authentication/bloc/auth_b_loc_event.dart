part of 'auth_b_loc_bloc.dart';

@immutable
sealed class AuthBLocEvent {}
class LoginEvent extends AuthBLocEvent{
   final String email;
   final String password;
    LoginEvent({
    required this.email,
    required this.password,
  });

}
