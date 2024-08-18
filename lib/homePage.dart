import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage>
    with SingleTickerProviderStateMixin {
  String? variable;
  final myController = TextEditingController();
  late AnimationController _animationController;
  late Animation<double> _fadeInAnimation;

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
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Location",
                            style: TextStyle(
                                fontSize: 20, height: 1, color: Colors.white),
                          ),
                          Text(
                            "19°",
                            style: TextStyle(
                                fontSize: 65,
                                fontWeight: FontWeight.w100,
                                height: 1,
                                color: Colors.white),
                          ),
                          Text(
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
                                              color: Color.fromARGB(72, 193, 154, 213),
                                              width: 2,
                                              style: BorderStyle.solid))),
                                  child: const Padding(
                                    padding: EdgeInsets.only(bottom:8),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Hourly Forecast",
                                          style: TextStyle(color: Color.fromARGB(136, 255, 255, 255)),
                                        ),
                                        Text(
                                          "weekly forecast",
                                          style: TextStyle(color: Color.fromARGB(136, 255, 255, 255)),
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
