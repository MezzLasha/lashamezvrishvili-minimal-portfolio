import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lashamezvrishvili/pages/home.dart';
import 'dart:math' as math;

import 'package:url_launcher/url_launcher.dart';

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

  @override
  Widget build(BuildContext context) {
    final mdof = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const LogoWidget(),
        centerTitle: true,
        titleSpacing: 0,
        toolbarHeight: 100,
        automaticallyImplyLeading: false,
        actions: [
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
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 800),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
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
                        child: SelectionArea(
                          selectionControls: MaterialTextSelectionControls(),
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
                      ),
                      const SizedBox(height: 36),
                      const Divider().animate(
                        effects: const [
                          SlideEffect(
                              curve: Curves.easeInOutCubicEmphasized,
                              duration: Duration(milliseconds: 500)),
                          FadeEffect(
                              curve: Curves.easeInOutCubicEmphasized,
                              delay: Duration(milliseconds: 100)),
                        ],
                        delay: const Duration(milliseconds: 200),
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
                        child: SelectionArea(
                          selectionControls: MaterialTextSelectionControls(),
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
                      const SizedBox(height: 36),
                      SizedBox(
                        height: 100,
                        child: Wrap(
                            direction: Axis.horizontal,
                            spacing: 15,
                            children: [
                              SizedBox(
                                height: 48,
                                width: 48,
                                child: ActionChip(
                                  label: const FaIcon(
                                    FontAwesomeIcons.github,
                                    color: Color(0xff171515),
                                  ),
                                  padding: const EdgeInsets.all(12),
                                  labelPadding: const EdgeInsets.all(0),
                                  onPressed: () {
                                    launch('https://github.com/MezzLasha');
                                  },
                                ),
                              ),
                              SizedBox(
                                height: 48,
                                width: 48,
                                child: ActionChip(
                                  label: const FaIcon(
                                    FontAwesomeIcons.linkedin,
                                    color: Color(0xff0077b5),
                                  ),
                                  padding: const EdgeInsets.all(12),
                                  labelPadding: const EdgeInsets.all(0),
                                  onPressed: () {
                                    launch(
                                        'https://www.linkedin.com/in/lasha-mezvrishvili-1b23b9187/');
                                  },
                                ),
                              ),
                              SizedBox(
                                height: 48,
                                width: 48,
                                child: ActionChip(
                                  label: Image.network(
                                    'https://play-lh.googleusercontent.com/y4bswMT02OROjzOPa5zDGsnXX5-cBABjF93j26seJH2cEHD4PuBW1d5VvwfYleeKf4_X',
                                  ),
                                  padding: const EdgeInsets.all(1),
                                  labelPadding: const EdgeInsets.all(0),
                                  onPressed: () {
                                    launch(
                                        'https://www.upwork.com/freelancers/~01815ca2791a9c33fc');
                                  },
                                ),
                              ),
                            ]),
                      ).animate(
                        effects: const [
                          SlideEffect(
                              curve: Curves.easeInOutCubicEmphasized,
                              duration: Duration(milliseconds: 500)),
                          FadeEffect(
                              curve: Curves.easeInOutCubicEmphasized,
                              delay: Duration(milliseconds: 100)),
                        ],
                        delay: const Duration(milliseconds: 600),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
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
