import 'package:dismissible_page/dismissible_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '/pages/about_page.dart';
import '/widgets/misc.dart';

class AboutMeButton extends StatefulWidget {
  const AboutMeButton(this.controller, {super.key});

  final AnimationController controller;

  @override
  State<AboutMeButton> createState() => _AboutMeButtonState();
}

class _AboutMeButtonState extends State<AboutMeButton> {
  bool hoveringAbout = false;

  @override
  Widget build(BuildContext context) => Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 48.0),
          child: InkWell(
            onTap: () => openAboutMePage(),
            onHover: (value) => setState(() => hoveringAbout = value),
            onLongPress: () => ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Using Wasm? - $kIsWasm'),
                duration: Duration(milliseconds: 500),
              ),
            ),
            borderRadius: BorderRadius.circular(24),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 700),
              curve: Easing.standard,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
              height: hoveringAbout ? 48 : 40,
              width: hoveringAbout ? 270 : 254,
              decoration: BoxDecoration(
                color: const Color(0xff1c1c1c),
                borderRadius: BorderRadius.circular(24),
                boxShadow: [if (hoveringAbout) ...darkSmoothBoxShadow],
              ),
              alignment: Alignment.center,
              child: const Text(
                'LASHA MEZVRISHVILI',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  letterSpacing: -1,
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ),
      );

  void openAboutMePage() async {
    widget.controller.reverse();
    await Future.delayed(const Duration(milliseconds: 300));
    if (!mounted) return;
    context.pushTransparentRoute(AboutMePage(widget.controller));
  }
}
