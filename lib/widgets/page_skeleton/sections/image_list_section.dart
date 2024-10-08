import 'package:dismissible_page/dismissible_page.dart';
import 'package:flutter/material.dart';
import 'package:smooth_corner/smooth_corner.dart';

import '/widgets/page_skeleton/page_section.dart';
import '/widgets/project_widgets.dart';
import 'title_section.dart';

class ImageListSection extends PageSection {
  final List<String> images;
  final double height;
  final double width;

  const ImageListSection({required this.images, this.height = 300, this.width = 160});

  static const _radius = 28.0;

  @override
  Widget build(BuildContext context) => Column(
        children: [
          const TitleSection('SCREENSHOTS.').build(context),
          SizedBox(
            height: height,
            child: SmoothClipRRect(
              borderRadius: BorderRadius.circular(_radius),
              smoothness: 0.6,
              child: CarouselView(
                itemExtent: width,
                shrinkExtent: width / 1.5,
                padding: const EdgeInsets.symmetric(horizontal: 4),
                shape: SmoothRectangleBorder(
                  smoothness: 0.6,
                  borderRadius: BorderRadius.circular(_radius),
                ),
                onTap: (value) => context.pushTransparentRoute(
                  Stack(
                    children: [
                      PageView(
                        physics: const BouncingScrollPhysics(
                          parent: AlwaysScrollableScrollPhysics(),
                        ),
                        controller: PageController(
                          initialPage: value,
                          viewportFraction: 1,
                        ),
                        children: List.generate(
                          images.length,
                          (index) => ExpandedScreenshotWidget(index, images),
                        ),
                      ),
                      Positioned(
                        top: 20,
                        right: 20,
                        child: IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: const Icon(
                            Icons.close,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                children: images
                    .map((e) => Hero(
                          tag: e,
                          child: Material(
                            color: Colors.transparent,
                            child: Ink.image(
                              image: AssetImage(e),
                              fit: BoxFit.fitHeight,
                            ),
                          ),
                        ))
                    .toList(),
              ),
            ),
          ),
        ],
      );
}
