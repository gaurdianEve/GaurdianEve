import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gaurdianeve/FakeCall/bloc/fake_call_bloc.dart';
import 'package:gaurdianeve/constants.dart';
import 'package:gaurdianeve/model/fakecontact.dart';
import 'package:google_fonts/google_fonts.dart';

class UpdateFakeCallAddScreen extends StatelessWidget {
  const UpdateFakeCallAddScreen({super.key, required this.firstContact});
  final FakeContact firstContact;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double aspectRatio = MediaQuery.of(context).size.aspectRatio;
    TextEditingController _fakename = TextEditingController();
    TextEditingController _fakephoneNo = TextEditingController();
    
    ScreenUtil();
    return Scaffold(
      backgroundColor: scaffoldBackgroundColor,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            FontAwesomeIcons.chevronLeft,
            size: 22,
            color: grey,
          ),
        ),
        backgroundColor: const Color(0x00000000),
        elevation: 0,
        title: Text(
          "     Update Fake Contact",
          style: GoogleFonts.poppins(color: grey, fontSize: 20.sp),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _fakename,
              decoration: 
              InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
                  constraints: BoxConstraints(
                      minHeight: 45,
                      maxHeight: 45,
                      maxWidth: width - 50,
                      minWidth: width - 50),
                  hintText: 'caller name',
                  hintStyle: GoogleFonts.poppins(
                      fontWeight: FontWeight.w300,
                      color: Colors.black,
                      letterSpacing: 1,
                      fontSize: 12.sp),
                  filled: true,
                  fillColor: const Color(0xFFF7F7F7),
                  border: const OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.circular(13)))),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: _fakephoneNo,
              decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
                  constraints: BoxConstraints(
                      minHeight: 45,
                      maxHeight: 45,
                      maxWidth: width - 50,
                      minWidth: width - 50),
                  hintText: 'phone no',
                  hintStyle: GoogleFonts.poppins(
                      fontWeight: FontWeight.w300,
                      color: Colors.black,
                      letterSpacing: 1,
                      fontSize: 12.sp),
                  filled: true,
                  fillColor: const Color(0xFFF7F7F7),
                  border: const OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.circular(13)))),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Specify  caller details to schedule the calls",
              style: GoogleFonts.poppins(
                color: pink,
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_fakename.text.isNotEmpty && _fakephoneNo.text.isNotEmpty) {
            final contact = FakeContact(callName: _fakename.text, phoneNo: _fakephoneNo.text);
            BlocProvider.of<FakeCallBloc>(context).add(UpdateFakeContact(firstContact,contact));
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('Updated successfully'),
                  ));
            _fakename.clear();
            _fakephoneNo.clear();
            
          }
          else{
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('Value are empty'),
                  ));
           
          }
        },
        backgroundColor: pink,
        child: const Icon(FontAwesomeIcons.check),
      ),
    );
  }
}
