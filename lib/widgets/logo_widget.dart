import 'package:flutter/material.dart';

import '/pages/about_page.dart';

class LogoWidget extends StatefulWidget {
  const LogoWidget({super.key});

  @override
  State<LogoWidget> createState() => _LogoWidgetState();
}

class _LogoWidgetState extends State<LogoWidget> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _animation = CurvedAnimation(
        parent: _controller,
        curve: Easing.standard,
        reverseCurve: Easing.standard.flipped);

    super.initState();
  }

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () => AboutMePage.openAboutMePage(context, _controller),
        child: SizedBox(
          height: 80,
          width: 80,
          child: Center(
              child: AnimatedBuilder(
            animation: _animation,
            builder: (context, child) => Stack(
              children: [
                Center(
                  child: Transform.translate(
                    offset: Offset(
                        0 + (-28 * _animation.value), -15 + (15 * _animation.value)),
                    child: Text(
                      'ME',
                      maxLines: 2,
                      overflow: TextOverflow.visible,
                      style: TextStyle(
                        fontSize: 40,
                        height: 0.8,
                        letterSpacing: -10 + (10 * _animation.value),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Transform.translate(
                    offset: Offset(
                        0 + (28 * _animation.value), 15 + (-15 * _animation.value)),
                    child: const Text(
                      'ZZ',
                      maxLines: 2,
                      overflow: TextOverflow.visible,
                      style: TextStyle(
                        fontSize: 40,
                        height: 0.75,
                        letterSpacing: 0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                MouseRegion(
                  onEnter: (_) => _controller.forward(),
                  onExit: (_) => _controller.reverse(),
                  child: const SizedBox(
                    height: 80,
                    width: 100,
                  ),
                )
              ],
            ),
          )),
        ),
      );
}
