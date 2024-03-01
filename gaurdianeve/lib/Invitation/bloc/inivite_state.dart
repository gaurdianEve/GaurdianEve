part of 'inivite_bloc.dart';

@immutable
sealed class IniviteState {}



final class Invites extends IniviteState {
  Invites({required this.inviteList});
  final List<Invite> inviteList;
}
final class Loading extends Invites {
  Loading({required super.inviteList});
}
