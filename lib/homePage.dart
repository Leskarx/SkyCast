import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  String? variable;
 final myController = TextEditingController();
 
 @override
  void initState() {
   
    super.initState();
    print("init state");
    Timer(Duration(seconds: 5), (){
      print("printing after 5 sec");});
  }


  @override
  void dispose() {
    myController.dispose();
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    print("build");
    return 
      Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.1, 0.5, 0.7, 0.9],
          colors: [
            Color.fromARGB(255, 34, 25, 69),
            Color.fromARGB(255, 92, 36, 164),
            Color.fromARGB(255, 138, 2, 242),
            Color.fromARGB(255, 124, 1, 255),
          ],
        ),
      ),

      child: Scaffold(
        backgroundColor:Colors.transparent,

        body:Padding(
          padding: const EdgeInsets.all(16),
          child: Container(
           
            child:  Column(
              children: [
                TextField(
                  controller: myController,
                 decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  filled: true,
                  hintText: "Search for any location",
                  fillColor: Colors.white
                 ),
                  
                ),
              ElevatedButton(onPressed: (){
                setState(() {
                  variable=myController.text;
                });
                print(myController.text);

              }, child: Text("Click me")),
             Container(
              height: 300,
              color:Colors.red,
              child: Text("hello ${variable}"),
             )
              ],
            ),
            
          ),
        ),
      ) ,
    );
  }
}