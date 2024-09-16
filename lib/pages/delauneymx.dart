import 'package:dismissible_page/dismissible_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_tabs/flutter_custom_tabs.dart';
import 'package:lashamezvrishvili/widgets/project_page_skeleton.dart';
import 'package:smooth_corner/smooth_corner.dart';

import '../widgets/project_widgets.dart';

const delauneyScreenshots = {
  'assets/images/delauneymx_images/1.png',
  'assets/images/delauneymx_images/2.png',
  'assets/images/delauneymx_images/3.png',
  'assets/images/delauneymx_images/4.png',
  'assets/images/delauneymx_images/5.png',
  'assets/images/delauneymx_images/6.png',
  'assets/images/delauneymx_images/7.png',
};

class DelauneyPage extends StatelessWidget {
  const DelauneyPage({super.key});

  @override
  Widget build(BuildContext context) {
    final mdof = MediaQuery.of(context);
    return ProjectPageSkeleton(
        bgImageUrl: 'assets/images/delauneymx_images/bg_image.png',
        headerUrl: 'Delauney.mx',
        name: 'Delauney.mx',
        url: '/delauneymx',
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
                        children: List.generate(delauneyScreenshots.length, (index) {
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
                                          delauneyScreenshots.length,
                                          (index2) => ExpandedScreenshotWidget(
                                              index2, delauneyScreenshots),
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
                                                delauneyScreenshots.elementAt(index)),
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
                              'This app was developed for Delauney.mx. A Shampoo and health-care company located in mexico. \n\n'),
                      TextSpan(
                          text:
                              'App was developed using Flutter, Firebase and php(server/mysql). \n\n'),
                      TextSpan(
                          text:
                              'TimeFrame: 1.5 months. \nDelivered Products: Mobile App for iOS and Android, Administrator panel, Backend made in php / mySQL on a dedicated VPS. \n'),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 48,
            ),
            const HeaderWidget(
              title: 'Check it out on\nGoogle Play Store.',
              style: TextStyle(
                  fontFamily: 'Neue',
                  color: Color(0xffd5fcc1),
                  fontSize: 30,
                  fontWeight: FontWeight.w900),
            ),
            const SizedBox(
              height: 16,
            ),
            AspectRatio(
                aspectRatio: 1.734,
                child: InkWell(
                  onTap: () async {
                    await launch(
                        'https://play.google.com/store/apps/details?id=com.delauney.mx');
                  },
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
                            image: const DecorationImage(
                                image: AssetImage(
                                    'assets/images/delauneymx_images/link_google_play_preview.png'),
                                fit: BoxFit.cover),
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
                      const Align(
                        alignment: Alignment.bottomRight,
                        child: Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.link,
                                color: Colors.black,
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Text(
                                'play.google.com',
                                style: TextStyle(
                                    fontFamily: 'Neue',
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FontStyle.italic),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                )),
            const SizedBox(
              height: 48,
            ),
            HeaderWidget(
              title: 'Check it out on\nApp Store.',
              style: TextStyle(
                  fontFamily: 'Neue',
                  color: Colors.blue[100],
                  fontSize: 30,
                  fontWeight: FontWeight.w900),
            ),
            const SizedBox(
              height: 16,
            ),
            AspectRatio(
                aspectRatio: 1.934,
                child: InkWell(
                  onTap: () async {
                    await launch('https://apps.apple.com/us/app/delauney/id6446408684');
                  },
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
                            image: const DecorationImage(
                                image: AssetImage(
                                    'assets/images/delauneymx_images/link_appstore_preview.png'),
                                fit: BoxFit.cover),
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
                      const Align(
                        alignment: Alignment.bottomRight,
                        child: Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.link,
                                color: Colors.black,
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Text(
                                'apps.apple.com',
                                style: TextStyle(
                                    fontFamily: 'Neue',
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FontStyle.italic),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                )),
            const SizedBox(
              height: 24,
            ),
          ],
        ));
  }
}
