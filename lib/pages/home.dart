import 'package:dismissible_page/dismissible_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:lashamezvrishvili/main.dart';
import 'package:lashamezvrishvili/pages/about_page.dart';
import 'package:smooth_corner/smooth_corner.dart';
import '../widgets/misc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  List<bool> hovering =
      List.generate(MyApp.routes_list.length, (index) => false);

  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
  }

  bool hoveringAbout = false;
  bool hoveringAddProject = false;

  @override
  Widget build(BuildContext context) {
    final mdof = MediaQuery.of(context);
    return Scaffold(
      body: Stack(
        children: [
          mdof.size.aspectRatio > 0.5625
              ? const Positioned(top: 24, left: 12, child: LogoWidget())
              : const Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: EdgeInsets.only(top: 24.0, right: 24),
                    child: LogoWidget(),
                  )),
          Center(
            child: Wrap(spacing: 10, runSpacing: 10, children: [
              ...List.generate(MyApp.routes_list.length, (index) {
                return Animate(
                  effects: [
                    ScaleEffect(
                      curve: Curves.easeInOutCubicEmphasized,
                      delay: Duration(milliseconds: 100 * index),
                    ),
                    FlipEffect(
                      curve: Curves.easeInOutCubicEmphasized,
                      delay: Duration(milliseconds: 100 * index),
                    )
                  ],
                  controller: _controller,
                  child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                              context, MyApp.routes_list.elementAt(index));
                        },
                        onHover: (value) {
                          setState(() {
                            hovering[index] = value;
                          });
                        },
                        borderRadius: BorderRadius.circular(6),
                        child: AnimatedContainer(
                          width: hovering[index] ? 200 : 160,
                          duration: const Duration(milliseconds: 700),
                          curve: Curves.easeInOutCubicEmphasized,
                          height: 160,
                          child: Stack(
                            children: [
                              Hero(
                                tag: MyApp.routes_list.elementAt(index),
                                createRectTween: (begin, end) {
                                  return MaterialRectCenterArcTween(
                                      begin: begin, end: end);
                                },
                                flightShuttleBuilder: (flightContext,
                                    animation,
                                    flightDirection,
                                    fromHeroContext,
                                    toHeroContext) {
                                  return AnimatedBuilder(
                                    animation: CurvedAnimation(
                                        parent: animation,
                                        curve: Curves.easeInOutCubicEmphasized),
                                    builder: (context, child) {
                                      return SmoothClipRRect(
                                          smoothness: 0.6,
                                          borderRadius: mdof.size.aspectRatio >
                                                  0.5625
                                              ? BorderRadius.circular(
                                                  6 + 90 * animation.value)
                                              : BorderRadius.only(
                                                  topLeft: Radius.circular(
                                                      6 + 42 * animation.value),
                                                  topRight: Radius.circular(
                                                      6 + 42 * animation.value),
                                                  bottomLeft: Radius.circular(
                                                      (6 -
                                                          6 * animation.value)),
                                                  bottomRight: Radius.circular(
                                                      (6 -
                                                          6 * animation.value)),
                                                ),
                                          child: mdof.size.aspectRatio > 0.5625
                                              ? Material(
                                                  child: Stack(
                                                    fit: StackFit.expand,
                                                    children: [
                                                      toHeroContext.widget,
                                                      Opacity(
                                                        opacity:
                                                            animation.value,
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      left:
                                                                          48.0),
                                                              child: IconButton(
                                                                  onPressed:
                                                                      () {},
                                                                  color: Colors
                                                                      .black,
                                                                  icon: const Icon(
                                                                      Icons
                                                                          .arrow_back)),
                                                            ),
                                                            const Spacer(),
                                                            Flexible(
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .only(
                                                                        right:
                                                                            48.0),
                                                                child: IconButton(
                                                                    onPressed:
                                                                        () {},
                                                                    color: Colors
                                                                        .black,
                                                                    icon: const Icon(
                                                                        Icons
                                                                            .open_in_new)),
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                      child!,
                                                    ],
                                                  ),
                                                )
                                              : Material(
                                                  child: Stack(
                                                    fit: StackFit.expand,
                                                    children: [
                                                      toHeroContext.widget,
                                                      Opacity(
                                                        opacity:
                                                            animation.value,
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      left:
                                                                          16.0),
                                                              child: IconButton(
                                                                  onPressed:
                                                                      () {},
                                                                  color: Colors
                                                                      .black,
                                                                  icon: const Icon(
                                                                      Icons
                                                                          .arrow_back)),
                                                            ),
                                                            const Spacer(),
                                                          ],
                                                        ),
                                                      ),
                                                      child!
                                                    ],
                                                  ),
                                                ));
                                    },
                                    child: Center(
                                      child: DefaultTextStyle(
                                          style: const TextStyle(
                                              fontFamily: 'Neue',
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 50),
                                          child: Text(
                                            " ${MyApp.routes_names.elementAt(index)}",
                                            softWrap: false,
                                            overflow: TextOverflow.fade,
                                          )),
                                    ),
                                  );
                                },
                                child: AnimatedContainer(
                                  // width: 120,
                                  duration: const Duration(milliseconds: 1000),
                                  curve: Curves.easeInOutCubicEmphasized,
                                  decoration: BoxDecoration(
                                      boxShadow: hovering[index]
                                          ? darkSmoothBoxShadow
                                          : const [
                                              BoxShadow(
                                                  color: Color.fromRGBO(
                                                      0, 0, 0, 0.0197),
                                                  spreadRadius: 0,
                                                  offset: Offset(0, 2.77),
                                                  blurRadius: 2.21),
                                            ],
                                      borderRadius: BorderRadius.circular(6),
                                      image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images${MyApp.routes_list.elementAt(index)}.png'),
                                        fit: BoxFit.cover,
                                      )),
                                ),
                              ),
                              Center(
                                child: DefaultTextStyle(
                                    style: const TextStyle(
                                        fontFamily: 'Neue',
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 50),
                                    child: Text(
                                      ' ${MyApp.routes_names.elementAt(index)}',
                                      softWrap: false,
                                      overflow: TextOverflow.fade,
                                    )),
                              ),
                            ],
                          ),
                        ),
                      )),
                );
              }),
              Animate(
                effects: [
                  ScaleEffect(
                    curve: Curves.easeInOutCubicEmphasized,
                    delay: Duration(
                        milliseconds: 100 * (MyApp.routes_list.length + 1)),
                  ),
                  FlipEffect(
                    curve: Curves.easeInOutCubicEmphasized,
                    delay: Duration(
                        milliseconds: 100 * (MyApp.routes_list.length + 1)),
                  )
                ],
                controller: _controller,
                child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: InkWell(
                      onTap: () {
                        openAboutMePage();
                      },
                      onHover: (value) {
                        setState(() {
                          hoveringAddProject = value;
                        });
                      },
                      borderRadius: BorderRadius.circular(6),
                      child: AnimatedContainer(
                        width: hoveringAddProject ? 165 : 160,
                        duration: const Duration(milliseconds: 700),
                        curve: Curves.easeInOutCubicEmphasized,
                        height: 160,
                        child: Stack(
                          children: [
                            Hero(
                              tag: 'AddProjectHero',
                              createRectTween: (begin, end) {
                                return MaterialRectCenterArcTween(
                                    begin: begin, end: end);
                              },
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 1000),
                                curve: Curves.easeInOutCubicEmphasized,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6),
                                    color: const Color.fromARGB(
                                        255, 241, 241, 241)),
                              ),
                            ),
                            const Center(
                              child: DefaultTextStyle(
                                  style: TextStyle(
                                      color: Colors.black45,
                                      fontWeight: FontWeight.w400,
                                      fontStyle: FontStyle.italic,
                                      height: 1.1,
                                      shadows: [
                                        ...darkSmoothBoxShadow,
                                      ],
                                      fontSize: 50),
                                  child: Text(
                                    '+',
                                    softWrap: false,
                                    overflow: TextOverflow.fade,
                                  )),
                            ),
                          ],
                        ),
                      ),
                    )),
              ),
            ]),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 48.0),
              child: SizedBox(
                height: 40,
                child: InkWell(
                  onTap: () {
                    openAboutMePage();
                  },
                  onHover: (value) {
                    setState(() {
                      hoveringAbout = value;
                    });
                  },
                  borderRadius: BorderRadius.circular(24),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 700),
                    curve: Curves.easeInOutCubicEmphasized,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                    decoration: BoxDecoration(
                        color: const Color(0xff1c1c1c),
                        borderRadius: BorderRadius.circular(24),
                        boxShadow: [if (hoveringAbout) ...darkSmoothBoxShadow]),
                    child: Transform.translate(
                      offset: const Offset(0, -2),
                      child: const Text('LASHA MEZVRISHVILI',
                          style: TextStyle(
                              fontFamily: 'Neue',
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              letterSpacing: -1,
                              fontSize: 20)),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  void openAboutMePage() async {
    _controller.reverse();
    await Future.delayed(const Duration(milliseconds: 300));
    // print('sdf');
    context.pushTransparentRoute(AboutMePage(_controller));
  }
}

class LogoWidget extends StatefulWidget {
  const LogoWidget({
    super.key,
  });

  @override
  State<LogoWidget> createState() => _LogoWidgetState();
}

class _LogoWidgetState extends State<LogoWidget>
    with SingleTickerProviderStateMixin {
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
        curve: Curves.easeInOutCubicEmphasized,
        reverseCurve: Curves.easeInOutCubicEmphasized.flipped);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, AboutMePage.routeName);
          },
          child: MouseRegion(
            onEnter: (_) {
              _controller.forward();
            },
            onExit: (_) {
              _controller.reverse();
            },
            child: Stack(
              children: [
                Transform.translate(
                  offset: Offset(
                      15 + (5 * _animation.value), 0 + (14 * _animation.value)),
                  child: const Text(
                    'ME',
                    maxLines: 2,
                    overflow: TextOverflow.visible,
                    style: TextStyle(
                      fontSize: 40,
                      height: 0.8,
                      letterSpacing: -10,
                      fontFamily: 'Neue',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Transform.translate(
                  offset: Offset(10 + (56 * _animation.value),
                      30 + (-15 * _animation.value)),
                  child: const Text(
                    'ZZ',
                    maxLines: 2,
                    overflow: TextOverflow.visible,
                    style: TextStyle(
                      fontSize: 40,
                      height: 0.75,
                      letterSpacing: 0,
                      fontFamily: 'Neue',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
