part of 'fake_call_bloc.dart';

@immutable
sealed class FakeCallEvent {}

class AddFakeContact extends FakeCallEvent {
  final FakeContact contact;
  AddFakeContact({required this.contact});
}

class UpdateFakeContact extends FakeCallEvent {
  final FakeContact firstContact;
  final FakeContact secondContact;
  UpdateFakeContact(this.firstContact, this.secondContact,);
}

class FetchFakeContacts extends FakeCallEvent {}
