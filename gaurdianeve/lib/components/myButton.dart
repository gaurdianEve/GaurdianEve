import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton({
    super.key,
    required this.onTap,
    required this.data
    });

  final void Function()? onTap;
  final String data;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap ,
      child:  Container(
        
        padding: const EdgeInsets.all(25),
        child:  Center(child: Text(data,style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold
        ),)),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(9)),
          color: Colors.black,
        ),
      ),
    );
  }
}