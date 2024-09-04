import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/widget/hourly.dart';
import 'package:flutter_application_1/widget/weekly.dart';

class homePage extends StatefulWidget {
  final String? temp;
  const homePage({Key? key,this.temp}) : super(key: key);

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage>
    with SingleTickerProviderStateMixin {
 
  String? variable;
  final myController = TextEditingController();
  late AnimationController _animationController;
  late Animation<double> _fadeInAnimation;
   var showingHourly=true;
  


  @override
  void initState() {
    super.initState();
    print("init state");

    // Initialize the AnimationController and Animation
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    _fadeInAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeIn,
    );

    // Start the fade-in animation
    _animationController.forward();

    // Example of using a Timer
    Timer(const Duration(seconds: 5), () {
      print("printing after 5 sec");
    });
  }

  @override
  void dispose() {
    myController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
   
    return Container(
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
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Padding(
            padding: const EdgeInsets.only(top: 18.0),
            child: TextField(
              controller: myController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                filled: true,
                hintText: "Search for any location",
                fillColor: Colors.white,
              ),
            ),
          ),
        ),
        body: Stack(
          children: [
            // Background image in the center
            Center(
              child: Image.asset(
                "assets/images/House.png", // Replace with your image asset
                fit: BoxFit.contain, // Adjust this as needed
                opacity: const AlwaysStoppedAnimation(
                    1), // Control image transparency
              ),
            ),
            // Foreground widgets
            FadeTransition(
              opacity: _fadeInAnimation,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(screenHeight / 25),
                      child:  Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Location",
                            style: TextStyle(
                                fontSize: 20, height: 1, color: Colors.white),
                          ),
                          Text(
                           "${widget.temp}°c",
                            style:const  TextStyle(
                                fontSize: 50,
                                fontWeight: FontWeight.w100,
                                height: 1,
                                color: Colors.white),
                          ),
                        const  Text(
                            "Mostly Clear",
                            style: TextStyle(
                                height: 1,
                                color: Color.fromARGB(255, 114, 114, 114)),
                          ),
                        ],
                      ),
                    ),

                    // Image.asset("assets/images/House.png"),
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(30),
                        topLeft: Radius.circular(30),
                      ),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                        child: Container(
                          height: screenHeight / 2.2,
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.6),
                            borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(30),
                              topLeft: Radius.circular(30),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 15),
                            child: Column(
                              children: [
                                Container(
                                  decoration: const BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Color.fromARGB(
                                                  72, 193, 154, 213),
                                              width: 2,
                                              style: BorderStyle.solid))),
                                  child: Padding(
                                    padding: const EdgeInsets.only(bottom: 8),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        InkWell(
                                          onTap: () {

                                            setState(() {
                                              showingHourly=true;
                                            });
                                          },
                                          child: Container(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 12, horizontal: 24),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              // adding color will hide the splash effect
                                              // color: Colors.blueGrey.shade200,
                                            ),
                                            child: const Text(
                                              "Hourly forecast",
                                              style: TextStyle(
                                                  color: Color.fromARGB(
                                                      167, 255, 255, 255)),
                                            ),
                                          ),
                                        ),
                                        InkWell(
                                       
                                          onTap: () {
                                            setState(() {
                                              showingHourly=false;
                                            });
                                          },
                                          child: Container(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 12, horizontal: 24),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              // adding color will hide the splash effect
                                              // color: Colors.blueGrey.shade200,
                                            ),
                                            child: const Text(
                                              "Weekly forecast",
                                              style: TextStyle(
                                                  color: Color.fromARGB(
                                                      167, 255, 255, 255)),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                showingHourly?hourly():Weekly(),


                             
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
