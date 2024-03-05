import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gaurdianeve/Invitation/bloc/inivite_bloc.dart';
import 'package:gaurdianeve/constants.dart';
import 'package:gaurdianeve/model/invite.dart';
import 'package:google_fonts/google_fonts.dart';

class NotificationTile extends StatelessWidget {
  const NotificationTile({
    super.key,
    required this.invite,
  });
  final Invite invite;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.all(8),
      height: 50,
      decoration: const BoxDecoration(
          color: Color(0xFFFFFFFF),
          borderRadius: BorderRadius.all(Radius.circular(20))),
      width: double.infinity,
      child: Row(
        children: [
          CircleAvatar(
            child: Image.asset("assets/images/person1.png"),
          ),
          Text(
            invite.senderUsername,
            style: GoogleFonts.poppins(),
          ),
          GestureDetector(
            onTap: () {
              BlocProvider.of<IniviteBloc>(context).add(AcceptInvite(invite));
            },
            child: const CircleAvatar(
              radius: 20,
              backgroundColor: teal,
              child: Icon(
                FontAwesomeIcons.check,
                color: Color(0xFFFFFFFF),
              ),
            ),
          ),
          const CircleAvatar(
            radius: 20,
            backgroundColor: pink,
            child: Icon(
              FontAwesomeIcons.xmark,
              color: Color(0xFFFFFFFF),
            ),
          ),
        ],
      ),
    );
  }
}
