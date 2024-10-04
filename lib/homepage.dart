// // import 'package:flutter/material.dart';
// // import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
// // import 'package:google_fonts/google_fonts.dart';

// // class KannurPage extends StatelessWidget {
// //   final List<String> images = [
// //     'asset/images/Thalassery_Sea_Bridge_Kannur_2577.jpg',
// //     'asset/images/Thalassery_Sea_Bridge_Kannur_2577.jpg',
// //     'asset/images/Thalassery_Sea_Bridge_Kannur_2577.jpg',
// //     'asset/images/Thalassery_Sea_Bridge_Kannur_2577.jpg',
// //     'asset/images/Thalassery_Sea_Bridge_Kannur_2577.jpg',
// //   ];

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: Colors.grey[200],
// //       body: SingleChildScrollView(
// //         child: Column(
// //           children: [
// //             // Top section with styled text
// //             Padding(
// //               padding: const EdgeInsets.only(top: 16.0),
// //               child: Text(
// //                 'KANNUR',
// //                 style: GoogleFonts.nerkoOne(
// //                   fontSize: 88,
// //                   fontWeight: FontWeight.bold,
// //                   foreground: Paint()
// //                     ..shader = LinearGradient(
// //                       colors: <Color>[
// //                         Colors.blue,
// //                         Colors.orange,
// //                         Colors.green,
// //                       ],
// //                     ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0)),
// //                 ),
// //               ),
// //             ),

// //             // Masonry Grid of images
// //             Padding(
// //               padding: const EdgeInsets.all(8.0),
// //               child: MasonryGridView.builder(
// //                 physics: NeverScrollableScrollPhysics(),
// //                 shrinkWrap: true,
// //                 gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
// //                   crossAxisCount: 2, // 2 columns
// //                 ),
// //                 mainAxisSpacing: 8,
// //                 crossAxisSpacing: 8,
// //                 itemCount: images.length,
// //                 itemBuilder: (context, index) {
// //                   return ClipRRect(
// //                     borderRadius: BorderRadius.circular(12.0),
// //                     child: Image.asset(
// //                       images[index],
// //                       fit: BoxFit.cover,
// //                     ),
// //                   );
// //                 },
// //               ),
// //             ),

// //             // Bottom section with "Explore more" button
// //             Padding(
// //               padding: const EdgeInsets.all(16.0),
// //               child: ElevatedButton(
// //                 onPressed: () {
// //                   // Action for Explore more
// //                 },
// //                 child: Text('Explore more'),
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
// import 'package:flutter/material.dart';
// import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
// import 'package:google_fonts/google_fonts.dart';

// class HomePage extends StatelessWidget {
//   final List<String> images = [
//     'asset/images/WhatsApp Image 2024-09-30 at 18.14.33_7a375fb1.jpg',
//     'asset/images/palakkayam-thattu-1.jpg',
//     'asset/images/6a41fe49-6626-40b5-b518-2c3276be05b5.jpg',
//     'asset/images/Thalassery_Sea_Bridge_Kannur_2577.jpg',
//     'asset/images/MUTHAPPAN-TEMPLE.jpg',
//     'asset/images/come-explore.jpg',
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color.fromARGB(255, 255, 255, 255),
//       body: Column(
//         children: [
//           // Top section with styled text
//           Padding(
//             padding: const EdgeInsets.only(top: 16.0),
//             child: Text(
//               'KANNUR',
//               style: GoogleFonts.nerkoOne(
//                 fontSize: 88,
//                 fontWeight: FontWeight.bold,
//                 foreground: Paint()
//                   ..shader = LinearGradient(
//                     colors: <Color>[
//                       Colors.blue,
//                       Colors.orange,
//                       Colors.green,
//                     ],
//                   ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0)),
//               ),
//             ),
//           ),

//           // Expanded Masonry Grid
//           Expanded(
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: MasonryGridView.count(
//                 crossAxisCount: 2, // 2 columns
//                 mainAxisSpacing: 18,
//                 crossAxisSpacing: 18,
//                 itemCount: images.length,
//                 itemBuilder: (context, index) {
//                   // Custom aspect ratio for each image to create varying heights
//                   return ClipRRect(
//                     borderRadius: BorderRadius.circular(12.0),
//                     child: Image.asset(
//                       images[index],
//                       fit: BoxFit.cover,
//                       height: (index % 2 == 0) ? 300 : 200, // Varying height
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ),

//           // Bottom section with "Explore more" button
//           TextButton(
//             onPressed: () {
//               // Action for Explore more
//             },
//             child: Text(
//               'Explore more',
//               style: TextStyle(color: Colors.black),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kannurblog/beachpage.dart';
import 'package:kannurblog/pages.dart';
import 'package:kannurblog/temples.dart';
import 'package:kannurblog/viewpoints.dart';
import 'dart:ui' as ui;

class HomePage extends StatelessWidget {
  final List<String> images = [
    'asset/images/WhatsApp Image 2024-09-30 at 18.14.33_7a375fb1.jpg',
    'asset/images/palakkayam-thattu-1.jpg',
    'asset/images/6a41fe49-6626-40b5-b518-2c3276be05b5.jpg',
    'asset/images/Thalassery_Sea_Bridge_Kannur_2577.jpg',
    'asset/images/MUTHAPPAN-TEMPLE.jpg',
    'asset/images/come-explore.jpg',
  ];
  Future<ui.Image> _loadImage(String assetPath) async {
    final Completer<ui.Image> completer = Completer();
    AssetImage(assetPath)
        .resolve(const ImageConfiguration())
        .addListener(ImageStreamListener((ImageInfo info, bool _) {
      completer.complete(info.image);
    }));
    return completer.future;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: Column(
        children: [
          // Top section with styled text
          // Padding(
          //   padding: const EdgeInsets.only(top: 16.0),
          //   child: Text(
          //     'KANNUR',
          //     style: GoogleFonts.nerkoOne(
          //       fontSize: 88,
          //       fontWeight: FontWeight.bold,
          //       foreground: Paint()
          //         ..shader = LinearGradient(
          //           colors: <Color>[
          //             Colors.blue,
          //             Colors.orange,
          //             Colors.green,
          //           ],
          //         ).createShader(Rect.fromLTWH(80.0, 0.0, 180.0, 70.0)),
          //     ),
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: FutureBuilder<ui.Image>(
              future: _loadImage('asset/images/b4.jpeg'),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done &&
                    snapshot.hasData) {
                  ui.Image image = snapshot.data!;
                  return ShaderMask(
                    shaderCallback: (Rect bounds) {
                      return ImageShader(
                        image,
                        TileMode.mirror,
                        TileMode.mirror,
                        Matrix4.identity().storage,
                      );
                    },
                    blendMode: BlendMode.srcIn,
                    child: Text(
                      'KANNUR',
                      style: GoogleFonts.nerkoOne(
                        fontSize: 88,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  );
                } else {
                  return Text(
                    'KANNUR',
                    style: GoogleFonts.nerkoOne(
                      fontSize: 88,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  );
                }
              },
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: MasonryGridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 18,
                crossAxisSpacing: 18,
                itemCount: images.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      switch (index) {
                        case 0:
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ImagePage()),
                          );
                          break;
                        case 1:
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ViewPoints()),
                          );
                          break;
                        case 2:
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BeachPage()),
                          );
                          break;
                        case 3:
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BeachPage()),
                          );
                          break;
                        case 4:
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Temples()),
                          );
                          break;
                        case 5:
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BeachPage()),
                          );
                          break;
                      }
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12.0),
                      child: Image.asset(
                        images[index],
                        fit: BoxFit.cover,
                        height: (index % 2 == 0) ? 300 : 240,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
