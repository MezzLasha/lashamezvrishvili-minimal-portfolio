import 'package:flutter/material.dart';
import 'package:flutter_custom_tabs/flutter_custom_tabs.dart';
import 'package:smooth_corner/smooth_corner.dart';

import '../page_section.dart';

class BannerSection extends PageSection {
  final String title;
  final String actionText;
  final String actionUrl;
  final String image;

  const BannerSection({
    required this.title,
    required this.actionText,
    required this.actionUrl,
    required this.image,
  });

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 42,
            ),
          ),
          const SizedBox(height: 16),
          AspectRatio(
            aspectRatio: 1.734,
            child: InkWell(
              onTap: () => launchUrl(Uri.parse(actionUrl)),
              customBorder: SmoothRectangleBorder(
                smoothness: 0.6,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Ink(
                      decoration: BoxDecoration(
                        borderRadius: SmoothRectangleBorder(
                          smoothness: 0.6,
                          borderRadius: BorderRadius.circular(12),
                        ).borderRadius,
                        image: DecorationImage(
                          image: AssetImage(image),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: SmoothRectangleBorder(
                        smoothness: 0.6,
                        borderRadius: BorderRadius.circular(12),
                      ).borderRadius,
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black.withOpacity(0.2),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.link,
                            color: Colors.black,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            actionText,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      );
}
