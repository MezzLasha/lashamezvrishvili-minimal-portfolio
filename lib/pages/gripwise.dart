import 'package:dismissible_page/dismissible_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_tabs/flutter_custom_tabs.dart';
import 'package:lashamezvrishvili/widgets/project_page_skeleton.dart';
import 'package:smooth_corner/smooth_corner.dart';

import '../widgets/project_widgets.dart';

const gripwiseScreenshots = {
  'assets/images/gripwise_images/1.png',
  'assets/images/gripwise_images/2.png',
  'assets/images/gripwise_images/3.png',
  'assets/images/gripwise_images/4.png',
  'assets/images/gripwise_images/5.png',
  'assets/images/gripwise_images/6.png',
  'assets/images/gripwise_images/7.png',
};

class GripwisePage extends StatelessWidget {
  const GripwisePage({super.key});

  @override
  Widget build(BuildContext context) {
    final mdof = MediaQuery.of(context);
    return ProjectPageSkeleton(
        bgImageUrl: 'assets/images/gripwise_images/bg_image.png',
        headerUrl: 'Delauney.mx',
        name: 'Gripwise',
        url: '/gripwise',
        body: Column(
          children: [
            SizedBox(
              height: mdof.size.aspectRatio > 0.5625 ? 48 : 0,
            ),
            Column(
              children: [
                const HeaderWidget(
                  title: 'SCREENSHOTS.',
                ),
                SizedBox(
                  height: 250,
                  width: double.infinity,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: ListView(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(
                            parent: AlwaysScrollableScrollPhysics()),
                        children:
                            List.generate(gripwiseScreenshots.length, (index) {
                          // print(index);
                          return Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: Hero(
                              tag: 'screenshot$index',
                              createRectTween: (begin, end) {
                                return MaterialRectCenterArcTween(
                                    begin: begin, end: end);
                              },
                              child: Material(
                                color: Colors.transparent,
                                shape: SmoothRectangleBorder(
                                    smoothness: 0.6,
                                    borderRadius: BorderRadius.circular(8)),
                                child: InkWell(
                                  onTap: () {
                                    // print(index);
                                    context.pushTransparentRoute(
                                      PageView(
                                        physics: const BouncingScrollPhysics(
                                            parent:
                                                AlwaysScrollableScrollPhysics()),
                                        // padEnds: true,
                                        controller: PageController(
                                            initialPage: index,
                                            viewportFraction: 1),
                                        children: List.generate(
                                          gripwiseScreenshots.length,
                                          (index2) => ExpandedScreenshotWidget(
                                              index2, gripwiseScreenshots),
                                        ),
                                      ),
                                    );
                                  },
                                  borderRadius: BorderRadius.circular(8),
                                  child: Ink(
                                    width: 150,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        image: DecorationImage(
                                            image: AssetImage(
                                                gripwiseScreenshots
                                                    .elementAt(index)),
                                            fit: BoxFit.fitHeight)),
                                  ),
                                ),
                              ),
                            ),
                          );
                        })),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 48,
            ),
            Column(
              children: [
                const HeaderWidget(
                  title: 'DESCRIPTION.',
                ),
                const SizedBox(
                  height: 16,
                ),
                RichText(
                  text: const TextSpan(
                    style: TextStyle(
                        fontFamily: 'Neue', color: Colors.white, fontSize: 16),
                    children: [
                      TextSpan(
                          text:
                              'This app was developed for Netherlands company "Gripwise".  Project\'s scope is creating an easy to use equipment, work and timeframe management tools all in one, fitted to work with their workflows and procedures.\n\n'),
                      TextSpan(
                          text:
                              'App was developed using Flutter for front-end and Firebase as back-end. \n\n'),
                      TextSpan(
                          text:
                              'Product is field tested on usage for high quality production films and movies. \n'),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 48,
            ),
            const SizedBox(
              height: 24,
            ),
          ],
        ));
  }
}
