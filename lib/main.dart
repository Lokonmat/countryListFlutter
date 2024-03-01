import 'package:flutter/material.dart';
import 'package:ulkeler/screen/main_screen.dart';

void main(){
  runApp(AnaUygulama());
}

class AnaUygulama extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AnaSayfa(),
    );
  }

}