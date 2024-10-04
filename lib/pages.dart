// import 'package:flutter/material.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:google_fonts/google_fonts.dart';

// class ImagePage extends StatelessWidget {
//   final List<String> imagePaths = [
//     'asset/images/IMG-20241001-WA0011.jpg',
//     'asset/images/IMG-20241001-WA0003.jpg',
//     'asset/images/IMG-20241001-WA0007.jpg',
//     'asset/images/IMG-20241001-WA0003.jpg',
//     'asset/images/IMG-20241001-WA0005.jpg',
//     'asset/images/IMG-20241001-WA0002.jpg',
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // appBar: AppBar(
//       //   title: const Text('കണ്ണൂർ'),
//       // ),
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.only(top: 8.0),
//             child: Text(
//               'THEYYAM',
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
//           CarouselSlider(
//             options: CarouselOptions(
//               height: 380.0,
//               autoPlay: true,
//               enlargeCenterPage: true,
//               aspectRatio: 2.0,
//             ),
//             items: imagePaths.map((path) {
//               return Builder(
//                 builder: (BuildContext context) {
//                   return Container(
//                     margin: const EdgeInsets.all(5.0),
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(15.0),
//                       image: DecorationImage(
//                         image: AssetImage(path),
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                   );
//                 },
//               );
//             }).toList(),
//           ),

//           const SizedBox(height: 20),

//           // GridView for the bottom images
//           Expanded(
//             child: GridView.builder(
//               padding: const EdgeInsets.all(10),
//               gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 2, // Number of items per row
//                 crossAxisSpacing: 10,
//                 mainAxisSpacing: 10,
//               ),
//               itemCount: imagePaths.length,
//               itemBuilder: (BuildContext context, int index) {
//                 return ClipRRect(
//                   borderRadius: BorderRadius.circular(10),
//                   child: Image.asset(
//                     imagePaths[index],
//                     fit: BoxFit.cover,
//                   ),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:ui' as ui;

class ImagePage extends StatefulWidget {
  @override
  _ImagePageState createState() => _ImagePageState();
}

class _ImagePageState extends State<ImagePage> {
  final List<String> imagePaths = [
    'asset/images/IMG-20241001-WA0011.jpg',
    'asset/images/IMG-20241001-WA0003.jpg',
    'asset/images/IMG-20241001-WA0007.jpg',
    'asset/images/IMG-20241001-WA0003.jpg',
    'asset/images/IMG-20241001-WA0005.jpg',
    'asset/images/IMG-20241001-WA0002.jpg',
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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: FutureBuilder<ui.Image>(
              future: _loadImage('asset/images/IMG-20241001-WA0008.jpg'),
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
                      'THEYYAM',
                      style: GoogleFonts.nerkoOne(
                        fontSize: 88,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  );
                } else {
                  return Text(
                    'THEYYAM',
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
          CarouselSlider(
            options: CarouselOptions(
              height: 380.0,
              autoPlay: true,
              enlargeCenterPage: true,
              aspectRatio: 2.0,
            ),
            items: imagePaths.map((path) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    margin: const EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      image: DecorationImage(
                        image: AssetImage(path),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              );
            }).toList(),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(10),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: imagePaths.length,
              itemBuilder: (BuildContext context, int index) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    imagePaths[index],
                    fit: BoxFit.cover,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
