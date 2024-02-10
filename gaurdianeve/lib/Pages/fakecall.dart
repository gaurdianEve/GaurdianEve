import 'package:flutter/material.dart';
import 'package:gaurdianeve/components/fakeCallContact.dart';

import '../components/fakecallContainer.dart';

class FakeCall extends StatelessWidget {
  const FakeCall({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double aspectRatio = MediaQuery.of(context).size.aspectRatio;

    return Column(
      children: [
        // AnimatedContainer(duration: Duration(),child:
        // ),
        FakeCallInstructionContainer(),
        FakeCallContactContainer()
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
