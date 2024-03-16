import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gaurdianeve/FakeCall/bloc/fake_call_bloc.dart';
import 'package:gaurdianeve/components/fakeCallContact.dart';

import '../../../../components/fakecallContainer.dart';

class FakeCall extends StatelessWidget {
  const FakeCall({super.key});
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<FakeCallBloc>(context).add(FetchFakeContacts());
    return Column(
      children: [
        const FakeCallInstructionContainer(),
        BlocBuilder<FakeCallBloc, FakeCallState>(
          builder: (context, state) {
            if (state is FakeCallContacts) {
              return Expanded(
                child: ListView.builder(
                  itemCount: state.fakeContactList.length,
                  itemBuilder: (context, index) {
                    final contact = state.fakeContactList[index];
                    return FakeCallContactContainer(contact: contact);
                  },
                ),
              );
            } else {
              return const Text('No fake contacts available');
            }
          },
        ),
      ],
    );
  }
}
// class CallNotification extends StatelessWidget {
//   const CallNotification({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: ,
//     );
//   }
// }
