import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_application_1/homePage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'dart:convert';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();
 
apiCall();
    // Timer(const Duration(seconds: 3), () {
    //   Navigator.pushReplacement(
    //       context,
    //       MaterialPageRoute(
    //         builder: (context) => const homePage(),
    //       ));
    // });
  }
 
 void apiCall() async {
  const api =
      "https://api.openweathermap.org/data/2.5/weather?q=Jorhat&APPID=ec80bfbf062a396b619cec6dab1d9d3c";
  var response = await http.get(Uri.parse(api));
  var data = jsonDecode(response.body);
  var tempData = double.parse(data['main']['temp'].toString());
  var finalData = tempData - 273.15;
  
  // Convert double to String with desired precision
  String tempString = finalData.toStringAsFixed(1); // e.g., "23.5"

  Navigator.pushReplacement(
    context,
    MaterialPageRoute(
      builder: (context) => homePage(temp: tempString),
    ),
  );
}


  @override
  Widget build(BuildContext context) {
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
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                alignment: Alignment.center,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(17)),
                height: 300,
                width: double.infinity,
                child: Image.asset(
                  "assets/images/main.png",
                  scale: 1,
                ),
              ),
              Container(
                  height: 250,
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Weather",
                            style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                  fontWeight: FontWeight.w900,
                                  color: Colors.white,
                                  fontSize: 50),
                            ),
                          ),
                          const SizedBox(height: 0),
                          Text(
                            "ForeCasts",
                            style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                  height: 0.8,
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromRGBO(221, 177, 48, 1),
                                  fontSize: 50),
                            ),
                          ),
                        ],
                      ),
                      Lottie.asset(
                        "assets/animations/splash.json",
                        height: 100, // Adjust height as needed
                        width: 300, // Adjust width as needed
                        repeat: true,
                        reverse: false,
                        animate: true,
                      )
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
