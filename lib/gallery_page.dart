import 'dart:async';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:ui' as ui;
import 'image_detail_page.dart';

class GalleryPage extends StatefulWidget {
  final List<String> images;
  final String title;
  final String titleBackgroundImage;
  final List<String>? descriptions;

  const GalleryPage({
    super.key,
    required this.images,
    required this.title,
    required this.titleBackgroundImage,
    this.descriptions,
  });

  @override
  State<GalleryPage> createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
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
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final isSmallScreen = width < 600;

    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: FutureBuilder<ui.Image>(
                    future: _loadImage(widget.titleBackgroundImage),
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
                            widget.title,
                            style: GoogleFonts.nerkoOne(
                              fontSize: isSmallScreen ? 88 : 88,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        );
                      } else {
                        return Text(
                          widget.title,
                          style: GoogleFonts.nerkoOne(
                            fontSize: isSmallScreen ? 88 : 88,
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
                    height: height * 0.4,
                    autoPlay: true,
                    enlargeCenterPage: true,
                    aspectRatio: isSmallScreen ? 1.5 : 2.0,
                  ),
                  items: widget.images.map((path) {
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
                LayoutBuilder(
                  builder: (context, constraints) {
                    int crossAxisCount = constraints.maxWidth < 600 ? 2 : 3;
                    return GridView.builder(
                      padding: const EdgeInsets.all(10),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: crossAxisCount,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      itemCount: widget.images.length,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            if (widget.descriptions != null &&
                                widget.descriptions!.length > index) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ImageDetailPage(
                                    imagePath: widget.images[index],
                                    description: widget.descriptions![index],
                                  ),
                                ),
                              );
                            }
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              widget.images[index],
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
          // Custom back button
          Positioned(
            top: 24,
            left: 4,
            child: Material(
              color: Color.fromARGB(74, 113, 111, 111),
              shape: const CircleBorder(),
              child: IconButton(
                icon: const Icon(Icons.arrow_back,
                    color: Color.fromARGB(255, 103, 97, 97), size: 28),
                onPressed: () => Navigator.of(context).pop(),
                tooltip: 'Back',
                splashRadius: 28,
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
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
