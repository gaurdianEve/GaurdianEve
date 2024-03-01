import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gaurdianeve/Invitation/bloc/inivite_bloc.dart';
import 'package:gaurdianeve/components/notificationTile.dart';
import 'package:gaurdianeve/constants.dart';
import 'package:gaurdianeve/model/invite.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class NoficationScreen extends StatefulWidget {
  const NoficationScreen({super.key});

  @override
  State<NoficationScreen> createState() => _NoficationScreenState();
}

class _NoficationScreenState extends State<NoficationScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<IniviteBloc>(context).add(LoadingInvite());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldBackgroundColor,
      appBar: AppBar(
        leading: Icon(
          FontAwesomeIcons.chevronLeft,
          color: teal,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Nofication',
          style: GoogleFonts.caveat(fontSize: 25.sp, color: teal),
        ),
      ),
      body: BlocBuilder<IniviteBloc, IniviteState>(
        builder: (context, state) {
          switch (state.runtimeType) {
            case Loading:
              {
                return Center(child: LoadingAnimationWidget.stretchedDots(color: pink, size: 50),);
              }

            case Invites:
              {
                List<Invite> invites = (state as Invites).inviteList;
                List<Widget> inTextInvites = [];
                for (var invite in invites) {
                  inTextInvites.add(NotificationTile(invite: invite));
                }
                return Column(children: inTextInvites);
              }
            default:
              {
                return Text("Some thing wrong!");
              }
          }
        },
      ),
    );
  }
}
