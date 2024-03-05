import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gaurdianeve/model/fakecontact.dart';
import 'package:meta/meta.dart';

part 'fake_call_event.dart';
part 'fake_call_state.dart';

class FakeCallBloc extends Bloc<FakeCallEvent, FakeCallState> {
  FakeCallBloc() : super(FakeCallContacts(fakeContactList: const [])) {
    on<FetchFakeContacts>((event, emit) async {
      final contacts =await fetchFakeContacts();
      emit(FakeCallContacts(fakeContactList:contacts));
    });
    
    on<AddFakeContact>((event, emit) async {
      final currentState = state;
      if (currentState is FakeCallContacts) {
        // Handle the event here, for example, add the new contact to the list
      
        addFakeContact(event.contact);
        final contacts =await fetchFakeContacts();
        emit(FakeCallContacts(fakeContactList: contacts));
      }
    });
    on<UpdateFakeContact>((event, emit) async {
      updateFakeContact(event.firstContact,event.secondContact);
      final contacts = await fetchFakeContacts();
      emit(FakeCallContacts(fakeContactList: contacts));

    });
    
  }
}

Future<List<FakeContact>> fetchFakeContacts() async {
  final db = FirebaseFirestore.instance;
  final user = FirebaseAuth.instance.currentUser;
  if (user != null) {
    final snapshot = await db
        .collection('userFakeContact')
        .doc(user.uid)
        .collection('contacts')
        .get();
    final List<FakeContact> contacts = snapshot.docs.map((doc) => FakeContact.fromJson(doc.data())).toList();
    return contacts;
    // Handle the contacts list, for example, emit a state with the contacts
  }
  return [];
}

void addFakeContact(FakeContact contact) {
  final db = FirebaseFirestore.instance;
  final user = FirebaseAuth.instance.currentUser;
  db
      .collection('userFakeContact')
      .doc(user!.uid)
      .collection('contacts')
      .add(contact.toJson());
}

void updateFakeContact(FakeContact firstContact,FakeContact secondContact) {
  final db = FirebaseFirestore.instance;
  final user = FirebaseAuth.instance.currentUser;
  print("inupdate");
  if (user != null) {
    db
        .collection('userFakeContact')
        .doc(user.uid)
        .collection('contacts')
        .where('callName', isEqualTo: firstContact.callName)
        .where('phoneNo', isEqualTo: firstContact.phoneNo)
        .get()
        .then((querySnapshot) {
          print("in then");
          if (querySnapshot.docs.isNotEmpty) {
            print("in doc");
            // Assuming there's only one document matching the name and phoneNumber
            final docId = querySnapshot.docs[0].id;
            db
                .collection('userFakeContact')
                .doc(user.uid)
                .collection('contacts')
                .doc(docId)
                .update({
                  'callName': secondContact.callName,
                  'phoneNo': secondContact.phoneNo,
                  // Add other fields to update here
                });
          }
        });
  }
  
}
