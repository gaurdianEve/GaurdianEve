import 'package:flutter/material.dart';
import 'package:gaurdianeve/constants.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble(
      {super.key,
      required this.senderEmail,
      required this.aligment,
      required this.message});
  final CrossAxisAlignment aligment;
  final String senderEmail;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: aligment,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 8),
              child: Text(
                senderEmail,
                style: const TextStyle(fontSize: 10, color: Colors.black26),
              ),
            ),
            const SizedBox(
              height: 2,
            ),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  message,
                  style: TextStyle(
                    color: whiteD,
                    background: Paint()
                      ..strokeWidth = 30.0
                      ..color = Color(0xFF34B0B3)
                      ..style = PaintingStyle.stroke
                      ..strokeJoin = StrokeJoin.round,
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
