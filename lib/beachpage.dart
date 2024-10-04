import 'dart:async';

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:ui' as ui;

class BeachPage extends StatefulWidget {
  @override
  _BeachPage createState() => _BeachPage();
}

class _BeachPage extends State<BeachPage> {
  final List<String> imagePaths = [
    'asset/images/b1.jpg',
    'asset/images/b2.jpg',
    'asset/images/b3.jpg',
    'asset/images/b4.jpeg',
    'asset/images/b5.jpg',
    'asset/images/b6.jpeg',
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
                      'BEACHES',
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
                      // borderRadius: BorderRadius.circular(15.0),
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
                crossAxisCount: 2, // Number of items per row
                crossAxisSpacing: 18,
                mainAxisSpacing: 18,
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
