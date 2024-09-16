import 'package:dismissible_page/dismissible_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_custom_tabs/flutter_custom_tabs.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '/widgets/hoverable_mail_button.dart';
import '/widgets/logo_widget.dart';

class AboutMePage extends StatefulWidget {
  const AboutMePage(this.controller, {super.key});

  final AnimationController controller;

  static const String routeName = '/about_me';

  static void openAboutMePage(
    BuildContext context,
    AnimationController controller,
  ) async {
    controller.reverse();
    await Future.delayed(const Duration(milliseconds: 300));
    if (!context.mounted) return;
    context.pushTransparentRoute(AboutMePage(controller));
  }

  @override
  State<AboutMePage> createState() => _AboutMePageState();
}

class _AboutMePageState extends State<AboutMePage> {
  @override
  void dispose() {
    widget.controller.forward();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
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
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(Icons.close),
                ),
              ),
            ),
          ],
        ),
        body: Center(
          child: Stack(
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
                                  curve: Easing.standard,
                                  duration: Duration(milliseconds: 500)),
                              FadeEffect(
                                  curve: Easing.standard,
                                  delay: Duration(milliseconds: 100)),
                            ],
                            child: SelectionArea(
                              selectionControls: MaterialTextSelectionControls(),
                              child: const Column(children: [
                                Text.rich(
                                  TextSpan(
                                    style: TextStyle(
                                      fontSize: 36,
                                      color: Color(0xff1c1c1c),
                                      letterSpacing: -1,
                                      fontFamily: 'NeueMontreal',
                                    ),
                                    children: [
                                      TextSpan(text: 'Hi, I\'m '),
                                      TextSpan(
                                        text: 'Lasha Mezvrishvili',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontFamily: 'Neue',
                                        ),
                                      ),
                                      TextSpan(
                                          text:
                                              ',\nA Flutter developer, with an eye for '),
                                      TextSpan(
                                        text: 'Visuals ',
                                        style: TextStyle(
                                          color: Color.fromARGB(255, 211, 67, 0),
                                          fontWeight: FontWeight.w600,
                                          fontFamily: 'Neue',
                                        ),
                                      ),
                                      TextSpan(
                                        text: '& ',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontFamily: 'Neue',
                                        ),
                                      ),
                                      TextSpan(
                                        text: 'Motion ',
                                        style: TextStyle(
                                          letterSpacing: -2,
                                          fontWeight: FontWeight.w600,
                                          fontFamily: 'Neue',
                                          fontStyle: FontStyle.italic,
                                        ),
                                      ),
                                      TextSpan(text: ',  from Tbilisi, Georgia.'),
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
                                  curve: Easing.standard,
                                  duration: Duration(milliseconds: 500)),
                              FadeEffect(
                                  curve: Easing.standard,
                                  delay: Duration(milliseconds: 100)),
                            ],
                            delay: const Duration(milliseconds: 200),
                          ),
                          const SizedBox(height: 36),
                          Animate(
                            effects: const [
                              SlideEffect(
                                  curve: Easing.standard,
                                  duration: Duration(milliseconds: 500)),
                              FadeEffect(
                                  curve: Easing.standard,
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
                                    curve: Easing.standard,
                                    duration: Duration(milliseconds: 500)),
                                FadeEffect(
                                    curve: Easing.standard,
                                    delay: Duration(milliseconds: 100)),
                              ],
                              delay: const Duration(milliseconds: 400),
                              child: const HoverableMailButton()),
                          const SizedBox(height: 36),
                          SizedBox(
                            height: 100,
                            child:
                                Wrap(direction: Axis.horizontal, spacing: 15, children: [
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
                                  onPressed: () => launch('https://github.com/MezzLasha'),
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
                                  onPressed: () => launch(
                                    'https://www.linkedin.com/in/lasha-mezvrishvili-1b23b9187/',
                                  ),
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
                                        'https://www.upwork.com/freelancers/mezvrishvililasha');
                                  },
                                ),
                              ),
                            ]),
                          ).animate(
                            effects: const [
                              SlideEffect(
                                  curve: Easing.standard,
                                  duration: Duration(milliseconds: 500)),
                              FadeEffect(
                                  curve: Easing.standard,
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
        ),
      );
}
