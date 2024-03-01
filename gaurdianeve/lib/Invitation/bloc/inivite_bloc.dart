import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:gaurdianeve/model/invite.dart';
import 'package:meta/meta.dart';

part 'inivite_event.dart';
part 'inivite_state.dart';

class IniviteBloc extends Bloc<IniviteEvent, Invites> {
  IniviteBloc() : super(Loading(inviteList: const [])) {
    on<LoadingInvite>((event, emit) async {
      final db = FirebaseFirestore.instance;
      final List<Invite> invites = [];
      await db.collection("invites").get().then((event) {
        for (QueryDocumentSnapshot doc in event.docs) {
          final Invite invite =
              Invite.fromJson(doc.data() as Map<String, dynamic>);
          invite.docID = doc.id;
          invites.add(invite);
        }
        emit(Invites(inviteList: invites));
      });
    });

    on<AcceptInvite>((event, emit) async {
      final db = FirebaseFirestore.instance;
      final invite = event.invite;
      await db.collection('invites').doc(invite.docID).delete();
      await FirebaseFirestore.instance
          .collection('friends')
          .doc(invite.byUser)
          .collection('friend')
          .add({"friend": event.invite.reciverID}).then((value) async => {
                  await FirebaseFirestore.instance
                    .collection('friends')
                    .doc(FirebaseAuth.instance.currentUser!.uid)
                    .collection('friend')
                    .add({"friend": event.invite.byUser})
              });

      // Update the user's document to add the new friend
      state.inviteList.remove(invite);
      emit(Invites(inviteList: state.inviteList));
    });

    on<SendInvite>((event, emit) {
      final invite = event.invite;
      FirebaseFirestore.instance.collection('invites').add(invite.toJson());
    });
  }
}
