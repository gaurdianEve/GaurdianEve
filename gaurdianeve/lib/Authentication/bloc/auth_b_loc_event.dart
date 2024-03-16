part of 'auth_b_loc_bloc.dart';

@immutable
sealed class AuthBLocEvent {}

class LoginEvent extends AuthBLocEvent {
  final String email;
  final String password;
  LoginEvent({
    required this.email,
    required this.password,
  });
}

class CheckLogging extends AuthBLocEvent {}

class CreateUser extends AuthBLocEvent {
  final String email;
  final String username;
  final String password;
  CreateUser({
    required this.username,
    required this.email,
    required this.password,
  });
}

class UpdatingUser extends AuthBLocEvent {
  final UserProfile user;

  UpdatingUser(this.user);
  
}

class SignOut extends AuthBLocEvent{

}
