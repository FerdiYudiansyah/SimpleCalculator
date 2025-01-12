import 'package:flutter/material.dart';

class Calculatebutton extends StatelessWidget{
  final onPressed;
  final text;
  Calculatebutton({required this.onPressed,required this.text});
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: this.onPressed,
      child: Text(
        text,
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: Color.fromARGB(255, 119, 196, 255)),
        )
      ,
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(Color(0xff083358)),
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          )
        )
      )
    );
  }
  
}

class equalsbutton extends StatelessWidget{
  final onPressed;
  final text;
  equalsbutton({required this.onPressed,required this.text});
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: this.onPressed,
      child: Text(text,style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold, color: Colors.white),)
      ,style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(Color.fromARGB(255, 244, 146, 0)),
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          )
        )
      )
    );
  }
  
}