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
                backgroundColor: const Color(0xff0a0a0a),
                onTap: (index) => DismissableGallery.showModal(context, images, index),
                children: images
                    .map(
                      (e) => Hero(
                        tag: e,
                        flightShuttleBuilder: (_, anim, __, fHCtx, tHCtx) =>
                            AnimatedBuilder(
                          animation: anim,
                          builder: (context, child) => SmoothClipRRect(
                            smoothness: 0.6,
                            borderRadius: BorderRadius.circular(_radius),
                            child: Image.asset(
                              e,
                              fit: BoxFit.fitHeight,
                            ),
                          ),
                        ),
                        child: Image.asset(
                          e,
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
        ],
      );
}
