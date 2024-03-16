import 'package:flutter/material.dart';
import 'package:gaurdianeve/constants.dart';

class Help extends StatelessWidget {
  const Help({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDF0FD),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          "Help and Services",
          style: TextStyle(fontSize: 30, color: blackD),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                const Questions(
                  question:
                      "Are there any privacy measures in place for messaging feature?",
                ),
                const Questions(
                  question:
                      "Does the app provide resources on information on safety tips and emergency contacts?",
                ),
                const Questions(
                  question: "Can someone else trigger a fake call on my phone?",
                ),
                const Questions(
                  question:
                      "Will the app be available on different platforms(e.g. tablets ,computer)?",
                ),
                const Questions(
                  question:
                      "Does the app provide resources on information on safety tips and emergency contacts?",
                ),
                const Questions(
                  question:
                      "Does the app provide resources on information on safety tips and emergency contacts?",
                ),
                const Questions(
                  question:
                      "Does the app provide resources on information on safety tips and emergency contacts?",
                ),
                const Questions(
                  question:
                      "Does the app provide resources on information on safety tips and emergency contacts?",
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  margin: const EdgeInsets.all(20),
                  height: 180,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Color(0xffffffff),
                    borderRadius: BorderRadius.all(
                      Radius.circular(25),
                    ),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Didn't Find Answer",
                          style: TextStyle(fontSize: 26),
                        ),
                        const SizedBox(height: 20,),

                        GestureDetector(
                          onTap: (){
                            // Navigator.push(context, MaterialPageRoute(builder:(context) {
                            //   return WidgetClassName();
                              
                            // },));
                          },
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(25)),
                              color: Color(0xFFFFDBFF),
                            ),
                            
                            child: const Text("CONTACT US"),),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Questions extends StatelessWidget {
  const Questions({super.key, required this.question});
  final String question;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          question,
          style: const TextStyle(color: grey, fontSize: 16),
        ),
        const SizedBox(
          height: 14,
        ),
        const Divider(
          color: grey,
        )
      ],
    );
  }
}


