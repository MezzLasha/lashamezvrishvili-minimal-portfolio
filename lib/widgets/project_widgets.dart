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

class ExpandedScreenshotWidget extends StatelessWidget {
  const ExpandedScreenshotWidget(
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
        child: FractionallySizedBox(
          heightFactor: 0.85,
          child: Hero(
            tag: screenshots.elementAt(index),
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Material(
                color: Colors.transparent,
                child: Ink.image(
                  image: AssetImage(screenshots.elementAt(index)),
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
          ),
        ),
      );
}
