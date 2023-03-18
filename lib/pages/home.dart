import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
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
                child: SizedBox(
                  height: 100,
                  width: 120,
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
                                    : BorderRadius.circular(
                                        6 - 6 * animation.value),
                                child: mdof.size.aspectRatio > 0.5625
                                    ? Material(
                                        child: Stack(
                                          fit: StackFit.expand,
                                          children: [
                                            toHeroContext.widget,
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Flexible(
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 48.0),
                                                    child: IconButton(
                                                        onPressed: () {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        icon: const Icon(
                                                            Icons.arrow_back)),
                                                  ),
                                                ),
                                                const Spacer(),
                                                Flexible(
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
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
                                            const Center(
                                              child: DefaultTextStyle(
                                                  style: TextStyle(
                                                      fontFamily: 'Neue',
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 50),
                                                  child: Text(
                                                    " Vacancies",
                                                    softWrap: false,
                                                    overflow: TextOverflow.fade,
                                                  )),
                                            ),
                                          ],
                                        ),
                                      )
                                    : Material(
                                        child: Ink.image(
                                          image: const AssetImage(
                                              'assets/images/vacancies.png'),
                                          fit: BoxFit.cover,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Flexible(
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 16.0),
                                                  child: IconButton(
                                                      onPressed: () {
                                                        Navigator.pop(context);
                                                      },
                                                      icon: const Icon(
                                                          Icons.arrow_back)),
                                                ),
                                              ),
                                              const DefaultTextStyle(
                                                  style: TextStyle(
                                                      fontFamily: 'Neue',
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 50),
                                                  child: Text(
                                                    " Vacancies",
                                                    softWrap: false,
                                                    overflow: TextOverflow.fade,
                                                  )),
                                              const SizedBox.shrink(),
                                            ],
                                          ),
                                        ),
                                      ),
                              );
                            },
                            child: toHeroContext.widget,
                          );
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOutCubicEmphasized,
                          height: /*hovering[index] ? 110 : */ 100,
                          width: 120,
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
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Center(
                          child: DefaultTextStyle(
                              style: const TextStyle(
                                  fontFamily: 'Neue',
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 50),
                              child: Text(
                                MyApp.routes_names.elementAt(index),
                                softWrap: false,
                                overflow: TextOverflow.fade,
                              )),
                        ),
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
