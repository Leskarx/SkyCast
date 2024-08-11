import 'package:flutter/material.dart';
import 'package:flutter_application_1/practice.dart';


void main(){
  runApp(const Myapp() );

}

class Myapp extends StatelessWidget{
  const Myapp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
    
      home: LandingPage()  
    );
   
  }


}
