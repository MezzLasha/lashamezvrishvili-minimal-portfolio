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
          onPressed: () async {
            _controller.reverse();
            await Future.delayed(const Duration(milliseconds: 100));
            if (context.mounted) Navigator.pop(context);
          },
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.arrow_back_ios, color: Colors.white, size: 16),
              Text(
                'Back',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ],
          )),
    );
  }
}

class ExpandedScreenshotWidget extends StatelessWidget {
  const ExpandedScreenshotWidget(
    this.index,
    this.screenshots, {
    super.key,
  });
  final List<String> screenshots;
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
              child: GestureDetector(
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
