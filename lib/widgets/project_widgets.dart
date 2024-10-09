import 'package:dismissible_page/dismissible_page.dart';
import 'package:flutter/material.dart';

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

class DismissableGallery extends StatelessWidget {
  const DismissableGallery(
    this.index,
    this.screenshots, {
    super.key,
  });
  final List<String> screenshots;
  final int index;

  @override
  Widget build(BuildContext context) => DismissiblePage(
        onDismissed: () => Navigator.pop(context),
        startingOpacity: 0.5,
        isFullScreen: false,
        backgroundColor: Colors.black,
        child: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: FractionallySizedBox(
            heightFactor: 0.85,
            child: Hero(
              tag: screenshots.elementAt(index),
              child: Image.asset(
                screenshots.elementAt(index),
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
        ),
      );

  static showModal(BuildContext context, List<String> images, int index) {
    context.pushTransparentRoute(
      Stack(
        children: [
          PageView(
            physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics(),
            ),
            controller: PageController(
              initialPage: index,
              viewportFraction: 1,
            ),
            children: List.generate(
              images.length,
              (i) => DismissableGallery(i, images),
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
    );
  }
}
