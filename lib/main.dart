import 'package:flutter/material.dart';
import 'package:flutter_application_1/homePage.dart';
import 'package:flutter_application_1/splashScreen.dart';


void main(){
  runApp(const Myapp() );

}

class Myapp extends StatelessWidget{
  const Myapp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
    
      // home: Splashscreen() 
      home: homePage(),
    );
   
  }


}
