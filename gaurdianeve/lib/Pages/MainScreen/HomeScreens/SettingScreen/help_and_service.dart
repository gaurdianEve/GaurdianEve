import 'package:flutter/material.dart';
import 'package:gaurdianeve/constants.dart';
import 'package:google_fonts/google_fonts.dart';

class HelpService extends StatefulWidget {
  HelpService({Key? key}) : super(key: key);

  @override
  State<HelpService> createState() => _HelpServiceState();
}

class _HelpServiceState extends State<HelpService> {
  List<bool> isOpen = List.generate(15, (_) => false);

  List<Map<String, String>> faqList = [
    {
      'question': 'How does the app determine and update red zones?',
      'answer':
          'The app uses a combination of user reports, official data sources, and machine learning algorithms to determine red zones. These zones are continuously updated based on real-time data and user feedback.'
    },
    {
      'question':
          'Can users customize the alert settings based on their preferences?',
      'answer':
          'Yes, users can customize the alert settings based on their preferences, such as the distance from a red zone to receive alerts and the type of alerts they want to receive (e.g., sound, vibration, notification).'
    },
    {
      'question':
          'How does the fake call feature work, and how realistic is it?',
      'answer':
          'The fake call feature simulates an incoming call on the user\'s phone, complete with a realistic interface and ringtone. It can be activated discreetly by tapping a button in the app, providing a convincing way to seek help or deflect attention in unsafe situations.'
    },
    {
      'question':
          'Are there any privacy measures in place for the messaging feature?',
      'answer':
          'Yes, the messaging feature in the app uses end-to-end encryption to ensure that messages exchanged between users are private and secure. User data is also protected according to industry standards.'
    },
    {
      'question':
          'Does the app provide resources or information on safety tips and emergency contacts?',
      'answer':
          'Yes, the app includes a section with safety tips and resources for users, including information on local emergency contacts, self-defense techniques, and steps to take in unsafe situations.'
    },
    {
      'question':
          'Can users report incidents or provide feedback within the app?',
      'answer':
          'Yes, users can report incidents or provide feedback within the app. These reports are used to improve the accuracy of red zone data and enhance the app\'s functionality.'
    },
    {
      'question':
          'How does the app ensure accuracy in identifying red zones and providing alerts?',
      'answer':
          'The app combines user reports, official data sources, and machine learning algorithms to verify red zones and provide accurate alerts. User feedback and ongoing data analysis help improve the app\'s accuracy over time.'
    },
    {
      'question':
          'Are there plans to expand the app\'s features or availability to other regions?',
      'answer':
          'Yes, we are continuously working to expand the app\'s features and availability to other regions. We welcome feedback and suggestions from users to help prioritize future updates and improvements.'
    },
    {
      'question':
          'How does the app handle emergency situations, such as contacting authorities?',
      'answer':
          'In emergency situations, the app provides users with quick access to emergency contacts and services. Users can also activate the fake call feature or send their location to trusted contacts for assistance.'
    },
    {
      'question':
          'What measures are in place to prevent misuse of the fake call feature?',
      'answer':
          'The app includes safeguards to prevent misuse of the fake call feature, such as limiting the number of times it can be activated within a certain period and requiring confirmation before initiating a fake call.'
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldBackgroundColor,
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
                  height: 25,
                ),
                ExpansionPanelList(
                  expandIconColor: scaffoldBackgroundColor,
                  elevation: 0,
                  dividerColor: const Color(0x00FFFFFF),
                  animationDuration: const Duration(milliseconds: 650),
                  expandedHeaderPadding: const EdgeInsets.symmetric(vertical: 12),
                  children: faqList.asMap().entries.map((entry) {
                    int index = entry.key;
                    Map<String, String> faq = entry.value;
                    return ExpansionPanel(
                      canTapOnHeader: true,
                      backgroundColor: scaffoldBackgroundColor,
                      isExpanded: isOpen[index],
                      headerBuilder: (context, isExpanded) {
                        return Column(
                          children: [
                            Text(
                              faq['question']!,
                              style: GoogleFonts.moulpali(
                                  fontSize: 16, color: grey, height: 1.5),
                            ),
                            Divider(
                              color: grey.withAlpha(100),
                            )
                          ],
                        );
                      },
                      body: Text(
                        faq['answer']!,
                        style: GoogleFonts.moulpali(
                            fontSize: 16,
                            color: blackD.withAlpha(180),
                            height: 1.5),
                      ),
                    );
                  }).toList(),
                  expansionCallback: (panelIndex, isExpanded) {
                    setState(() {
                      isOpen[panelIndex] = !isExpanded;
                    });
                  },
                ),
                const AskQuestion()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AskQuestion extends StatelessWidget {
  const AskQuestion({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      height: 180,
      width: double.infinity,
      decoration:  BoxDecoration(
        color: const Color(0xffffffff),
        borderRadius: const BorderRadius.all(
          Radius.circular(25),
        ),
        boxShadow: [
          BoxShadow(
            color: grey.withAlpha(20),
            offset: const Offset(1, 0),
            blurRadius:10
          ),
        ],
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Didn't Find Answer",
              style: TextStyle(fontSize: 26),
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
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
                child: const Text("CONTACT US"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
