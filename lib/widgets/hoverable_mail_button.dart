import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_custom_tabs/flutter_custom_tabs.dart';

class HoverableMailButton extends StatefulWidget {
  const HoverableMailButton({super.key});

  @override
  State<HoverableMailButton> createState() => _HoverableMailButtonState();
}

class _HoverableMailButtonState extends State<HoverableMailButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () => launchUrl(Uri.parse('mailto:mezzlasha@gmail.com')),
        child: MouseRegion(
          onEnter: (_) => setState(() => _isHovered = true),
          onExit: (_) => setState(() => _isHovered = false),
          cursor: SystemMouseCursors.click,
          child: TweenAnimationBuilder<double>(
            tween: Tween(begin: 0, end: _isHovered ? 1 : 0),
            duration: Durations.medium4,
            curve: Easing.standard,
            builder: (context, value, child) => Stack(
              clipBehavior: Clip.none,
              children: [
                Transform.translate(offset: const Offset(30, 0), child: child!),
                Transform.rotate(
                  angle: value * math.pi / 4,
                  child: const Icon(Icons.arrow_outward, size: 24),
                ),
                Positioned(
                  left: 0,
                  top: 32,
                  height: 2,
                  child: Container(
                    color: Colors.black,
                    width: value * 275,
                  ),
                ),
              ],
            ),
            child: const Text(
              'mezzlasha@gmail.com',
              style: TextStyle(
                fontSize: 24,
                color: Color(0xff1c1c1c),
                height: 0.8,
                fontFamily: 'NeueMontreal',
              ),
            ),
          ),
        ),
      );
}
