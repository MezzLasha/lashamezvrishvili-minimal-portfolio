import 'package:dismissible_page/dismissible_page.dart';
import 'package:flutter/material.dart';
import 'package:smooth_corner/smooth_corner.dart';

class BackButtonProjectAnimating extends StatelessWidget {
  const BackButtonProjectAnimating({
    super.key,
    required AnimationController controller,
  }) : _controller = controller;

  final AnimationController _controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
      child: OutlinedButton(
          onPressed: () {
            _controller.reverse();
            Future.delayed(const Duration(milliseconds: 200))
                .then((value) => Navigator.pop(context));
          },
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.arrow_back_ios, color: Colors.white, size: 16),
              Text(
                'Back',
                style: TextStyle(
                  fontFamily: 'Neue',
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ],
          )),
    );
  }
}

class ScreenshotsListWidget extends StatelessWidget {
  const ScreenshotsListWidget({
    super.key,
    required this.screenshots,
  });

  final Set<String> screenshots;

  @override
  Widget build(BuildContext context) {
    return Column(
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
                children: List.generate(screenshots.length, (index) {
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
                        shape: SmoothRectangleBorder(
                            smoothness: 0.6,
                            borderRadius: BorderRadius.circular(8)),
                        child: InkWell(
                          onTap: () {
                            // print(index);
                            context.pushTransparentRoute(
                              Stack(
                                children: [
                                  PageView(
                                    physics: const BouncingScrollPhysics(
                                        parent:
                                            AlwaysScrollableScrollPhysics()),
                                    // padEnds: true,
                                    controller: PageController(
                                        initialPage: index,
                                        viewportFraction: 1),
                                    children: List.generate(
                                      screenshots.length,
                                      (index2) => ExpandedScreenshotWidget(
                                          index2, screenshots),
                                    ),
                                  ),
                                  Positioned(
                                    top: 20,
                                    right: 20,
                                    child: IconButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      icon: const Icon(
                                        Icons.close,
                                        color: Colors.white,
                                        size: 30,
                                      ),
                                    ),
                                  ),
                                ],
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
                                        screenshots.elementAt(index)),
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
    );
  }
}

class ExpandedScreenshotWidget extends StatelessWidget {
  const ExpandedScreenshotWidget(
    this.index,
    this.screenshots, {
    super.key,
  });
  final Set<String> screenshots;
  final int index;

  @override
  Widget build(BuildContext context) {
    return DismissiblePage(
      onDismissed: () {
        Navigator.pop(context);
      },
      startingOpacity: 0.5,
      isFullScreen: false,
      backgroundColor: Colors.black,
      child: Center(
        child: SizedBox(
          height: MediaQuery.of(context).size.height / 1.2,
          child: Hero(
            tag: 'screenshot$index',
            createRectTween: (begin, end) {
              return MaterialRectCenterArcTween(begin: begin, end: end);
            },
            child: Material(
              color: Colors.transparent,
              shape: SmoothRectangleBorder(
                  smoothness: 0.6, borderRadius: BorderRadius.circular(8)),
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Ink(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                          image: AssetImage(screenshots.elementAt(index)),
                          fit: BoxFit.fitHeight)),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({
    super.key,
    required this.title,
    this.style,
  });

  final String title;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(title,
              style: style ??
                  const TextStyle(
                      fontFamily: 'Neue',
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                      fontSize: 80)),
        ),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Divider(),
        ),
      ],
    );
  }
}
