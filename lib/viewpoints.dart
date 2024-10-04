// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'dart:ui' as ui;

// class ViewPoints extends StatefulWidget {
//   @override
//   _ViewPoints createState() => _ViewPoints();
// }

// class _ViewPoints extends State<ViewPoints> {
//   final List<String> imagePaths = [
//     'asset/images/v1.jpg',
//     'asset/images/v2.jpg',
//     'asset/images/v3.jpg',
//     'asset/images/v4.jpeg',
//     'asset/images/v5.jpg',
//     'asset/images/v6.jpg',
//   ];

//   Future<ui.Image> _loadImage(String assetPath) async {
//     final Completer<ui.Image> completer = Completer();
//     AssetImage(assetPath)
//         .resolve(const ImageConfiguration())
//         .addListener(ImageStreamListener((ImageInfo info, bool _) {
//       completer.complete(info.image);
//     }));
//     return completer.future;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.only(top: 8.0),
//             child: FutureBuilder<ui.Image>(
//               future: _loadImage('asset/images/v4.jpeg'),
//               builder: (context, snapshot) {
//                 if (snapshot.connectionState == ConnectionState.done &&
//                     snapshot.hasData) {
//                   ui.Image image = snapshot.data!;
//                   return ShaderMask(
//                     shaderCallback: (Rect bounds) {
//                       return ImageShader(
//                         image,
//                         TileMode.mirror,
//                         TileMode.mirror,
//                         Matrix4.identity().storage,
//                       );
//                     },
//                     blendMode: BlendMode.srcIn,
//                     child: Text(
//                       'VIEWPOINTS',
//                       style: GoogleFonts.nerkoOne(
//                         fontSize: 88,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.white,
//                       ),
//                     ),
//                   );
//                 } else {
//                   return Text(
//                     'VIEWPOINTS',
//                     style: GoogleFonts.nerkoOne(
//                       fontSize: 88,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.grey,
//                     ),
//                   );
//                 }
//               },
//             ),
//           ),
//           CarouselSlider(
//             options: CarouselOptions(
//               height: 440.0,
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
//                       // borderRadius: BorderRadius.circular(15.0),
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
//           Expanded(
//             child: GridView.builder(
//               padding: const EdgeInsets.all(18),
//               gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 2,
//                 crossAxisSpacing: 8,
//                 mainAxisSpacing: 8,
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

import 'package:kannurblog/homepage.dart';

class ViewPoints extends StatefulWidget {
  @override
  _ViewPoints createState() => _ViewPoints();
}

class _ViewPoints extends State<ViewPoints> {
  final List<String> imagePaths = [
    'asset/images/v1.jpg',
    'asset/images/v2.jpg',
    'asset/images/v3.jpg',
    'asset/images/v4.jpeg',
    'asset/images/v5.jpg',
    'asset/images/v6.jpg',
  ];

  int _selectedIndex = 0;

  Future<ui.Image> _loadImage(String assetPath) async {
    final Completer<ui.Image> completer = Completer();
    AssetImage(assetPath)
        .resolve(const ImageConfiguration())
        .addListener(ImageStreamListener((ImageInfo info, bool _) {
      completer.complete(info.image);
    }));
    return completer.future;
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (index == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    }
    if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    }
    if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    }
    if (index == 3) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: FutureBuilder<ui.Image>(
              future: _loadImage('asset/images/v4.jpeg'),
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
                      'VIEWPOINTS',
                      style: GoogleFonts.nerkoOne(
                        fontSize: 88,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  );
                } else {
                  return Text(
                    'VIEWPOINTS',
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
              height: 440.0,
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
              padding: const EdgeInsets.all(18),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
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
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blueAccent, Colors.purpleAccent],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white70,
          showSelectedLabels: true,
          showUnselectedLabels: false,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search_outlined),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border),
              label: 'Favorites',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
