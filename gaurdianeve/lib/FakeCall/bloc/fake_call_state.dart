part of 'fake_call_bloc.dart';

@immutable
abstract class FakeCallState {}

final class FakeCallContacts extends FakeCallState {
  final List<FakeContact> fakeContactList;
  FakeCallContacts({
    required this.fakeContactList,
  });
  
}
