// // import 'package:flutter/material.dart';
// // import 'package:google_fonts/google_fonts.dart';

// // class SplashScreen extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       home: Scaffold(
// //         backgroundColor: Colors.black, // Matches the background in the design
// //         body: Center(
// //           child: Column(
// //             children: [
// //               Expanded(
// //                 child: Stack(
// //                   children: [
// //                     Image.asset(
// //                       'asset/images/image.jpg', // Update with your image path
// //                       fit: BoxFit.cover,
// //                       height: double.infinity,
// //                       width: double.infinity,
// //                     ),
// //                     Positioned(
// //                       left: 44,
// //                       // top: 18, // Adjust the position based on your design
// //                       child: Column(
// //                         children: 'KANNUR'.split('').map((letter) {
// //                           return Stack(
// //                             children: [
// //                               Text(
// //                                 letter,
// //                                 style: GoogleFonts.nerkoOne(
// //                                   fontSize: 116,
// //                                   fontWeight: FontWeight.bold,
// //                                   foreground: Paint()
// //                                     ..style = PaintingStyle.stroke
// //                                     ..strokeWidth = 18
// //                                     ..color = Colors.white,
// //                                   shadows: [
// //                                     Shadow(
// //                                       blurRadius: 4.0,
// //                                       color: Colors.black,
// //                                       offset: Offset(2, 2),
// //                                     ),
// //                                   ],
// //                                 ),
// //                               ),
// //                               Text(
// //                                 letter,
// //                                 style: GoogleFonts.nerkoOne(
// //                                   fontSize: 118,
// //                                   fontWeight: FontWeight.bold,
// //                                   color: Colors.black,
// //                                 ),
// //                               ),
// //                             ],
// //                           );
// //                         }).toList(),
// //                       ),
// //                     ),
// //                   ],
// //                 ),
// //               ),
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// class SplashScreen extends StatefulWidget {
//   @override
//   _SplashScreenState createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<Offset> _animation;

//   @override
//   void initState() {
//     super.initState();

//     // Initialize the animation controller and animation.
//     _controller = AnimationController(
//       duration: Duration(seconds: 2), // Duration of the animation
//       vsync: this,
//     );

//     // Define a sliding animation from outside the screen (top) to the center.
//     _animation = Tween<Offset>(begin: Offset(0, -1), end: Offset(0, 0)).animate(
//       CurvedAnimation(
//         parent: _controller,
//         curve: Curves.easeInOut,
//       ),
//     );

//     // Start the animation when the screen loads.
//     _controller.forward();
//   }

//   @override
//   void dispose() {
//     _controller
//         .dispose(); // Clean up the controller when the widget is disposed.
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         backgroundColor: Colors.black, // Matches the background in the design
//         body: Center(
//           child: Column(
//             children: [
//               Expanded(
//                 child: Stack(
//                   children: [
//                     Image.asset(
//                       'asset/images/image.jpg', // Update with your image path
//                       fit: BoxFit.cover,
//                       height: double.infinity,
//                       width: double.infinity,
//                     ),
//                     Positioned(
//                       left: 44, // Adjust the position of the text
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: 'KANNUR'.split('').map((letter) {
//                           return SlideTransition(
//                             position: _animation,
//                             child: Stack(
//                               children: [
//                                 // Stroke Text
//                                 Text(
//                                   letter,
//                                   style: GoogleFonts.nerkoOne(
//                                     fontSize: 118, // Adjust font size to fit
//                                     fontWeight: FontWeight.bold,
//                                     // Stroke effect using Paint
//                                     foreground: Paint()
//                                       ..style = PaintingStyle.stroke
//                                       ..strokeWidth = 18
//                                       ..color = Colors.white, // Stroke color
//                                     shadows: [
//                                       Shadow(
//                                         blurRadius: 4.0,
//                                         color: Colors.black,
//                                         offset: Offset(2, 2),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                                 // Solid Text (fill) on top of stroke
//                                 Text(
//                                   letter,
//                                   style: GoogleFonts.nerkoOne(
//                                     fontSize: 118, // Adjust font size to fit
//                                     fontWeight: FontWeight.bold,
//                                     color: Colors.black, // Fill color
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           );
//                         }).toList(),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kannurblog/homepage.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
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
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Column(
            children: [
              Expanded(
                child: Stack(
                  children: [
                    Image.asset(
                      'asset/images/image.jpg',
                      fit: BoxFit.cover,
                      height: double.infinity,
                      width: double.infinity,
                    ),
                    Positioned(
                      left: 44, // Adjust the position of the text
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: 'KANNUR'.split('').map((letter) {
                          return FadeTransition(
                            opacity: _fadeAnimation,
                            child: Stack(
                              children: [
                                Text(
                                  letter,
                                  style: GoogleFonts.nerkoOne(
                                    fontSize: 118,
                                    fontWeight: FontWeight.bold,
                                    foreground: Paint()
                                      ..style = PaintingStyle.stroke
                                      ..strokeWidth = 18
                                      ..color = Colors.white,
                                    shadows: [
                                      Shadow(
                                        blurRadius: 4.0,
                                        color: Colors.black,
                                        offset: Offset(2, 2),
                                      ),
                                    ],
                                  ),
                                ),
                                Text(
                                  letter,
                                  style: GoogleFonts.nerkoOne(
                                    fontSize: 118,
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
