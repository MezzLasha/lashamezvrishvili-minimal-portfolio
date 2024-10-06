import 'package:dismissible_page/dismissible_page.dart';
import 'package:flutter/material.dart';
import 'package:smooth_corner/smooth_corner.dart';

import '/widgets/page_skeleton/page_section.dart';
import '/widgets/project_widgets.dart';
import 'title_section.dart';

class ImageListSection extends PageSection {
  final List<String> images;

  const ImageListSection({required this.images});

  @override
  Widget build(BuildContext context) => Column(
        children: [
          const TitleSection('SCREENSHOTS.').build(context),
          SizedBox(
            height: 250,
            width: double.infinity,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: ListView(
                scrollDirection: Axis.horizontal,
                physics:
                    const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                children: List.generate(
                  images.length,
                  (index) => Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: Hero(
                      tag: 'screenshot$index',
                      createRectTween: (begin, end) =>
                          MaterialRectCenterArcTween(begin: begin, end: end),
                      child: Material(
                        color: Colors.transparent,
                        shape: SmoothRectangleBorder(
                          smoothness: 0.6,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: InkWell(
                          onTap: () => context.pushTransparentRoute(
                            Stack(
                              children: [
                                PageView(
                                  physics: const BouncingScrollPhysics(
                                      parent: AlwaysScrollableScrollPhysics()),
                                  controller: PageController(
                                      initialPage: index, viewportFraction: 1),
                                  children: List.generate(
                                    images.length,
                                    (index2) => ExpandedScreenshotWidget(index2, images),
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
                          borderRadius: BorderRadius.circular(8),
                          child: Ink(
                            width: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              image: DecorationImage(
                                image: AssetImage(images.elementAt(index)),
                                fit: BoxFit.fitHeight,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      );
}
