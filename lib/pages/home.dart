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
    return Scaffold(
      body: Center(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
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
                                borderRadius: BorderRadius.circular(
                                    6 + 90 * (animation.value)),
                                child: Material(
                                  child: Ink.image(
                                    image: const NetworkImage(
                                        'https://lh3.googleusercontent.com/gK__LLaM4jqISqweP0_fxKpBhJuJgSJPqb7wuwRyqMwSBRnj1RJtgXrw69gdLsy2lyH33idBUO5whDJl1TYaHT50hMZc-tj1L49Iq0ctbynuU-0FbFk=w960'),
                                    fit: BoxFit.cover,
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
                              boxShadow: hovering[index] ? smoothBoxShadow : [],
                              borderRadius: BorderRadius.circular(6),
                              image: const DecorationImage(
                                image: NetworkImage(
                                  'https://lh3.googleusercontent.com/gK__LLaM4jqISqweP0_fxKpBhJuJgSJPqb7wuwRyqMwSBRnj1RJtgXrw69gdLsy2lyH33idBUO5whDJl1TYaHT50hMZc-tj1L49Iq0ctbynuU-0FbFk=w960',
                                ),
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
                              " ${MyApp.routes_names.elementAt(index)}",
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
