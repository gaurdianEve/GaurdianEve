part of 'inivite_bloc.dart';

@immutable
sealed class IniviteEvent {}

class SendInvite extends IniviteEvent{
  final Invite invite;
  SendInvite(this.invite);
}

class LoadingInvite extends IniviteEvent{
}

class AcceptInvite extends IniviteEvent{
  final Invite invite;
  AcceptInvite(this.invite);
  
}

class DeclineInvite extends IniviteEvent{
}
