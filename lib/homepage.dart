import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kannurblog/gallery_page.dart';
import 'package:kannurblog/data/app_data.dart';
import 'dart:ui' as ui;

class HomePage extends StatelessWidget {
  HomePage({super.key});

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
    final size = MediaQuery.of(context).size; // Get screen size
    final isLandscape = size.width > size.height; // Check for orientation

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        // Add scrolling
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 26),
              child: SizedBox(
                height: size.width * 0.28, // Just a bit larger than font size
                child: FutureBuilder<ui.Image>(
                  future: _loadImage(AppData.titleBackgroundImage),
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
                          AppData.pageTitles['HomePage']!,
                          style: GoogleFonts.nerkoOne(
                            fontSize: size.width * 0.26,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            height: 1.0, // Tighter line height
                          ),
                        ),
                      );
                    } else {
                      return const Text(
                        'KANNUR',
                        style: TextStyle(
                          fontSize: 88,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                          height: 1.0,
                        ),
                      );
                    }
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: MasonryGridView.count(
                crossAxisCount: isLandscape ? 3 : 2, // Responsive grid count
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                itemCount: AppData.homepageImages.length,
                shrinkWrap: true, // Ensures the grid takes only necessary space
                physics:
                    const NeverScrollableScrollPhysics(), // Disable grid scroll
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      switch (index) {
                        case 0:
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => GalleryPage(
                                images: AppData.theyyamImages,
                                title: AppData.pageTitles['ImagePage']!,
                                titleBackgroundImage:
                                    AppData.theyyamTitleBackgroundImage,
                                descriptions: AppData.theyyamDescriptions,
                              ),
                            ),
                          );
                          break;
                        case 1:
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => GalleryPage(
                                images: AppData.viewpointImages,
                                title: AppData.pageTitles['ViewPoints']!,
                                titleBackgroundImage:
                                    AppData.viewpointTitleBackgroundImage,
                                descriptions: AppData.viewpointDescriptions,
                              ),
                            ),
                          );
                          break;
                        case 2:
                        case 3:
                        case 5:
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => GalleryPage(
                                images: AppData.beachImages,
                                title: AppData.pageTitles['BeachPage']!,
                                titleBackgroundImage:
                                    AppData.beachTitleBackgroundImage,
                                descriptions: AppData.beachDescriptions,
                              ),
                            ),
                          );
                          break;
                        case 4:
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => GalleryPage(
                                images: AppData.templeImages,
                                title: AppData.pageTitles['Temples']!,
                                titleBackgroundImage:
                                    AppData.templeTitleBackgroundImage,
                                descriptions: AppData.templeDescriptions,
                              ),
                            ),
                          );
                          break;
                        default:
                          // No action for other indices
                          break;
                      }
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12.0),
                      child: Image.asset(
                        AppData.homepageImages[index],
                        fit: BoxFit.cover,
                        height: size.height * ((index % 4 == 0) ? 0.4 : 0.3),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
