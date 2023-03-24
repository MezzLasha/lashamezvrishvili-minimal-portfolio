import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_custom_tabs/flutter_custom_tabs.dart';
import 'package:lashamezvrishvili/pages/home.dart';
import 'dart:math' as math;

class AboutMePage extends StatefulWidget {
  const AboutMePage(this.controller, {super.key});

  final AnimationController controller;

  static const String routeName = '/about_me';

  @override
  State<AboutMePage> createState() => _AboutMePageState();
}

class _AboutMePageState extends State<AboutMePage>
// with SingleTickerProviderStateMixin
{
  // late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    // _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    // _controller.dispose();
    widget.controller.forward();
    super.dispose();
  }

  static const String headerString =
      'I\'m Lasha Mezvrishvili, a Flutter developer from Tbilisi, Georgia.';

  @override
  Widget build(BuildContext context) {
    final mdof = MediaQuery.of(context);
    return Scaffold(
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 800),
                child: Padding(
                  padding: const EdgeInsets.only(top: 128) +
                      const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Animate(
                        effects: const [
                          SlideEffect(
                              curve: Curves.easeInOutCubicEmphasized,
                              duration: Duration(milliseconds: 500)),
                          FadeEffect(
                              curve: Curves.easeInOutCubicEmphasized,
                              delay: Duration(milliseconds: 100)),
                        ],
                        child: Column(children: const [
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Hi, I\'m ',
                                  style: TextStyle(
                                    fontSize: 36,
                                    color: Color(0xff1c1c1c),
                                    letterSpacing: -1,
                                    fontFamily: 'NeueMontreal',
                                  ),
                                ),
                                TextSpan(
                                  text: 'Lasha Mezvrishvili',
                                  style: TextStyle(
                                    fontSize: 36,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: -1,
                                    color: Color(0xff1c1c1c),
                                    fontFamily: 'Neue',
                                  ),
                                ),
                                TextSpan(
                                  text:
                                      ',\nA Flutter developer, with an eye for ',
                                  style: TextStyle(
                                    fontSize: 36,
                                    color: Color(0xff1c1c1c),
                                    letterSpacing: -1,
                                    fontFamily: 'NeueMontreal',
                                  ),
                                ),
                                TextSpan(
                                  text: 'Visuals ',
                                  style: TextStyle(
                                    fontSize: 36,
                                    color: Color.fromARGB(255, 211, 67, 0),
                                    letterSpacing: -1,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Neue',
                                  ),
                                ),
                                TextSpan(
                                  text: '& ',
                                  style: TextStyle(
                                    fontSize: 36,
                                    color: Color(0xff1c1c1c),
                                    letterSpacing: -1,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Neue',
                                  ),
                                ),
                                TextSpan(
                                  text: 'Motion ',
                                  style: TextStyle(
                                    fontSize: 36,
                                    color: Color(0xff1c1c1c),
                                    letterSpacing: -2,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Neue',
                                    fontStyle: FontStyle.italic,
                                  ),
                                ),
                                TextSpan(
                                  text: ',  from Tbilisi, Georgia.',
                                  style: TextStyle(
                                    fontSize: 36,
                                    color: Color(0xff1c1c1c),
                                    letterSpacing: -1,
                                    fontFamily: 'NeueMontreal',
                                  ),
                                ),
                              ],
                            ),
                          )
                        ]),
                      ),
                      const SizedBox(height: 70),
                      Animate(
                        effects: const [
                          SlideEffect(
                              curve: Curves.easeInOutCubicEmphasized,
                              duration: Duration(milliseconds: 500)),
                          FadeEffect(
                              curve: Curves.easeInOutCubicEmphasized,
                              delay: Duration(milliseconds: 100)),
                        ],
                        delay: const Duration(milliseconds: 400),
                        child: const Text('GET IN TOUCH',
                            style: TextStyle(
                              fontSize: 86,
                              color: Color(0xff1c1c1c),
                              letterSpacing: -4,
                              height: 0.8,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Neue',
                            )),
                      ),
                      const SizedBox(height: 36),
                      Animate(
                          effects: const [
                            SlideEffect(
                                curve: Curves.easeInOutCubicEmphasized,
                                duration: Duration(milliseconds: 500)),
                            FadeEffect(
                                curve: Curves.easeInOutCubicEmphasized,
                                delay: Duration(milliseconds: 100)),
                          ],
                          delay: const Duration(milliseconds: 400),
                          child: const HoverableMailButton()),
                      // const SizedBox(height: 2004),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 100,
            width: double.infinity,
            child: Material(),
          ),
          mdof.size.aspectRatio > 0.5625
              ? const Positioned(top: 24, left: 12, child: LogoWidget())
              : const Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: EdgeInsets.only(top: 24.0, right: 24),
                    child: LogoWidget(),
                  )),
          Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.only(top: 24.0, right: 24),
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(
                    Icons.close,
                  ),
                ),
              )),
        ],
      ),
    );
  }
}

class HoverableMailButton extends StatefulWidget {
  const HoverableMailButton({
    super.key,
  });

  @override
  State<HoverableMailButton> createState() => _HoverableMailButtonState();
}

class _HoverableMailButtonState extends State<HoverableMailButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _animation = CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOutCubicEmphasized,
        reverseCurve: Curves.easeInOutCubicEmphasized.flipped);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        launch('mailto:mezzlasha@gmail.com');
      },
      child: MouseRegion(
        onEnter: (event) {
          // print('enter');
          _controller.forward();
        },
        onExit: (event) {
          // print('exit');
          _controller.reverse();
        },
        cursor: SystemMouseCursors.click,
        child: AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return Stack(
                clipBehavior: Clip.none,
                children: [
                  Transform.translate(
                      offset: const Offset(30, 0), child: child!),
                  Transform.rotate(
                    angle: _animation.value * math.pi / 4,
                    child: const Icon(
                      Icons.arrow_outward,
                      size: 24,
                    ),
                  ),
                  Positioned(
                    left: 0,
                    top: 32,
                    height: 2,
                    child: Container(
                      color: Colors.black,
                      width: _animation.value * 275,
                    ),
                  )
                ],
              );
            },
            child: const Text('mezzlasha@gmail.com',
                style: TextStyle(
                  fontSize: 24,
                  color: Color(0xff1c1c1c),
                  height: 0.8,
                  fontFamily: 'NeueMontreal',
                ))),
      ),
    );
  }
}
