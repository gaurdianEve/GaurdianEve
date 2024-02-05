part of 'auth_b_loc_bloc.dart';

@immutable
sealed class AuthBLocState {}

final class Authenticated extends AuthBLocState {
  final UserProfile user;
  Authenticated(this.user);
  
}
final class Unauthenticated extends AuthBLocState {}

final class Loading extends AuthBLocState {}

final class LoginState extends AuthBLocState{}
