import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lashamezvrishvili/main.dart';
import 'package:smooth_corner/smooth_corner.dart';
import '../widgets/misc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<bool> hovering =
      List.generate(MyApp.routes_list.length, (index) => false);

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
                    padding: EdgeInsets.only(top: 24.0),
                    child: LogoWidget(),
                  )),
          Center(
            child: Wrap(
              spacing: 10,
              runSpacing: 10,
              children: List.generate(MyApp.routes_list.length, (index) {
                return Padding(
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
                        width: hovering[index] ? 160 : 120,
                        duration: const Duration(milliseconds: 700),
                        curve: Curves.easeInOutCubicEmphasized,
                        height: 120,
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
                                                    (6 - 6 * animation.value)),
                                                bottomRight: Radius.circular(
                                                    (6 - 6 * animation.value)),
                                              ),
                                        child: mdof.size.aspectRatio > 0.5625
                                            ? Material(
                                                child: Stack(
                                                  fit: StackFit.expand,
                                                  children: [
                                                    toHeroContext.widget,
                                                    Opacity(
                                                      opacity: animation.value,
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    left: 48.0),
                                                            child: IconButton(
                                                                onPressed: () {
                                                                  Navigator.pop(
                                                                      context);
                                                                },
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
                                                                      () {
                                                                    //copy link to clipboard
                                                                    Clipboard.setData(
                                                                        const ClipboardData(
                                                                            text:
                                                                                'https://www.google.com'));
                                                                  },
                                                                  color: Colors
                                                                      .black,
                                                                  icon: const Icon(
                                                                      Icons
                                                                          .copy)),
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
                                                      opacity: animation.value,
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    left: 16.0),
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
                    ));
              }),
            ),
          ),
        ],
      ),
    );
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
        return MouseRegion(
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
        );
      },
    );
  }
}
