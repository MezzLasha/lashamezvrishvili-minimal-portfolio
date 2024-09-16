import 'package:dismissible_page/dismissible_page.dart';
import 'package:flutter/material.dart';
import 'package:lashamezvrishvili/widgets/project_page_skeleton.dart';
import 'package:smooth_corner/smooth_corner.dart';

import '../widgets/project_widgets.dart';

const aggregateScreenshots = {
  'assets/images/aggregate_images/1.jpg',
  'assets/images/aggregate_images/2.jpg',
  'assets/images/aggregate_images/3.jpg',
  'assets/images/aggregate_images/4.jpg',
  'assets/images/aggregate_images/5.jpg',
  'assets/images/aggregate_images/6.jpg',
  'assets/images/aggregate_images/7.jpg',
  'assets/images/aggregate_images/8.jpg',
  'assets/images/aggregate_images/9.jpg',
};

class AggregatePage extends StatelessWidget {
  const AggregatePage({super.key});

  @override
  Widget build(BuildContext context) {
    final mdof = MediaQuery.of(context);
    return ProjectPageSkeleton(
        bgImageUrl: 'assets/images/aggregate_images/bg_image.png',
        headerUrl: 'test',
        name: 'Aggregate',
        url: '/aggregate',
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
                        children: List.generate(aggregateScreenshots.length, (index) {
                          // print(index);
                          return Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: Hero(
                              tag: 'screenshot$index',
                              createRectTween: (begin, end) {
                                return MaterialRectCenterArcTween(begin: begin, end: end);
                              },
                              child: Material(
                                shape: SmoothRectangleBorder(
                                    smoothness: 0.6,
                                    borderRadius: BorderRadius.circular(8)),
                                child: InkWell(
                                  onTap: () {
                                    // print(index);
                                    context.pushTransparentRoute(
                                      PageView(
                                        physics: const BouncingScrollPhysics(
                                            parent: AlwaysScrollableScrollPhysics()),
                                        // padEnds: true,
                                        controller: PageController(
                                            initialPage: index, viewportFraction: 1),
                                        children: List.generate(
                                          aggregateScreenshots.length,
                                          (index2) => ExpandedScreenshotWidget(
                                              index2, aggregateScreenshots),
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
                                                aggregateScreenshots.elementAt(index)),
                                            fit: BoxFit.cover)),
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
                    style:
                        TextStyle(fontFamily: 'Neue', color: Colors.white, fontSize: 16),
                    children: [
                      TextSpan(
                          text:
                              'Aggregate is a mobile application for Android and iOS users. It\'s designed to help you trade your solana assets efficiently. \n\n'),
                      TextSpan(
                          text:
                              'With Aggregate, you can easily explore new NFTs, track your favorite Collectibles, sell and buy NFTs and keep track of your wallet and your trading performance. \n\n'),
                      TextSpan(
                          text:
                              'Built with Flutter, Aggregate is a cross-platform application that can be used on both Android and iOS devices. It integrates Phantom Solana mobile wallet with deep-linking. \n\n'),
                      TextSpan(
                          text:
                              'App Uses firebase for crashalytics and performance monitoring, and CoralCube, MagicEden and Hyperspace Rest APIs for seamless user experience between different platforms.  \n\n'),
                    ],
                  ),
                )
              ],
            ),
          ],
        ));
  }
}
