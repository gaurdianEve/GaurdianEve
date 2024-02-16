import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gaurdianeve/components/option.dart';
import 'package:gaurdianeve/constants.dart';

import '../components/userCard.dart';


class Setting extends StatelessWidget {
  const Setting({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double aspectRatio = MediaQuery.of(context).size.aspectRatio;
    double avatarContainerHeight = height / 4;
    double settingContainerHeight = height * aspectRatio; // Adjusted calculation

    print(aspectRatio);

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading:  Padding(
            padding: EdgeInsets.only(left: 16),
            child: GestureDetector(
              onTap: (){
                Navigator.pop(context);
              },
              child: Icon(
                FontAwesomeIcons.chevronLeft,
                color: grey,
              ),
            ),
          ),
        ),
        backgroundColor: scaffoldBackgroundColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          child: Column(
            children: [
              UserCard(containerHeight: avatarContainerHeight, width: width),
              const SizedBox(height: 28,),
              Container(
                height: settingContainerHeight,
                width: double.infinity,
                decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18)),
                child: ListView(children:  [

                   const Divider(height: 10 ,thickness: 0,color: Colors.white,),
                   const Option(asset: "assets/images/headset.svg", name: "Help and Services"),
                    Divider(height: settingContainerHeight/14 ,color: Colors.grey.shade400,thickness: 0,),
                   const Option(asset: "assets/images/feedback.svg", name: "Feedback"),
                    Divider(height:  settingContainerHeight/14,color: Colors.grey.shade400,thickness: 0,),
                   const Option(asset: "assets/images/noti.svg", name: "Notification"),
                    Divider(height:  settingContainerHeight/14,color: Colors.grey.shade400,thickness: 0,),
                   const Option(asset: "assets/images/invite.svg", name: "Invite friend"),
                    Divider(height:  settingContainerHeight/14,color: Colors.grey.shade400,thickness: 0,),
                   const Option(asset: "assets/images/logout.svg", name: "Log Out"),

                ]),)
            ],
          ),
        ));
  }
}

