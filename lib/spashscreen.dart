import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kannurblog/homepage.dart';
import 'package:kannurblog/data/app_data.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    // Initialize the animation controller.
    _controller = AnimationController(
      duration: Duration(seconds: 4), // Duration of the fade animation
      vsync: this,
    );

    // Define a fade animation that starts from 0 (invisible) to 1 (fully visible).
    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    // Start the animation when the screen loads.
    _controller.forward();
    Timer(Duration(seconds: 8), () {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => HomePage()));
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Fetch the size of the screen
    final size = MediaQuery.of(context).size;

    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Column(
            children: [
              Expanded(
                child: Stack(
                  children: [
                    // Background image
                    Image.asset(
                      AppData.splashBackgroundImage,
                      fit: BoxFit.cover,
                      height: size.height, // Make the image take full height
                      width: size.width, // Make the image take full width
                    ),
                    // Text positioned centrally, but with responsive adjustments
                    Positioned(
                      left:
                          size.width * 0.15, // Make the text's position dynamic
                      top: size.height * 0.01, // Position text responsively
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: AppData.pageTitles['HomePage']!
                            .split('')
                            .map((letter) {
                          return FadeTransition(
                            opacity: _fadeAnimation,
                            child: Stack(
                              children: [
                                // Outline text for stroke effect
                                Text(
                                  letter,
                                  style: GoogleFonts.nerkoOne(
                                    fontSize: size.width *
                                        0.24, // Responsive font size
                                    fontWeight: FontWeight.bold,
                                    foreground: Paint()
                                      ..style = PaintingStyle.stroke
                                      ..strokeWidth = size.width *
                                          0.025 // Responsive stroke width
                                      ..color = Colors.white,
                                    shadows: const [
                                      Shadow(
                                        blurRadius: 4.0,
                                        color: Colors.black,
                                        offset: Offset(2, 2),
                                      ),
                                    ],
                                  ),
                                ),
                                // Main text in black for the fill effect
                                Text(
                                  letter,
                                  style: GoogleFonts.nerkoOne(
                                    fontSize: size.width *
                                        0.24, // Responsive font size
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
