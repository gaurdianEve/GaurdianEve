part of 'auth_b_loc_bloc.dart';

@immutable
sealed class AuthBLocState {}

final class Authenticated extends AuthBLocState {}
final class Unauthenticated extends AuthBLocState {}
final class Loading extends AuthBLocState {}
