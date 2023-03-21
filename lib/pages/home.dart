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
      body: Center(
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
                        flightShuttleBuilder: (flightContext, animation,
                            flightDirection, fromHeroContext, toHeroContext) {
                          return AnimatedBuilder(
                            animation: CurvedAnimation(
                                parent: animation,
                                curve: Curves.easeInOutCubicEmphasized),
                            builder: (context, child) {
                              return SmoothClipRRect(
                                  smoothness: 0.6,
                                  borderRadius: mdof.size.aspectRatio > 0.5625
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
                                                          const EdgeInsets.only(
                                                              left: 48.0),
                                                      child: IconButton(
                                                          onPressed: () {
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          icon: const Icon(Icons
                                                              .arrow_back)),
                                                    ),
                                                    const Spacer(),
                                                    Flexible(
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                right: 48.0),
                                                        child: IconButton(
                                                            onPressed: () {
                                                              //copy link to clipboard
                                                              Clipboard.setData(
                                                                  const ClipboardData(
                                                                      text:
                                                                          'https://www.google.com'));
                                                            },
                                                            icon: const Icon(
                                                                Icons.copy)),
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
                                              child ?? toHeroContext.widget,
                                              Opacity(
                                                opacity: animation.value,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 16.0),
                                                      child: IconButton(
                                                          onPressed: () {},
                                                          icon: const Icon(Icons
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
                                  ? smoothBoxShadow
                                  : const [
                                      BoxShadow(
                                          color:
                                              Color.fromRGBO(0, 0, 0, 0.0197),
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
      )),
    );
  }
}
