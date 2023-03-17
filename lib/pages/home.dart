import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:lashamezvrishvili/main.dart';

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
                child: Hero(
                  tag: MyApp.routes_list.elementAt(index),
                  createRectTween: (begin, end) {
                    return MaterialRectCenterArcTween(begin: begin, end: end);
                  },
                  flightShuttleBuilder: (flightContext, animation,
                      flightDirection, fromHeroContext, toHeroContext) {
                    return AnimatedBuilder(
                      animation: CurvedAnimation(
                          parent: animation,
                          curve: Curves.easeInOutCubicEmphasized),
                      builder: (context, child) {
                        return ClipRRect(
                          borderRadius:
                              BorderRadius.circular(6 + 96 * (animation.value)),
                          child: child,
                        );
                      },
                      child: toHeroContext.widget,
                    );
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOutCubicEmphasized,
                    height: /*hovering[index] ? 110 : */ 100,
                    width: 105,
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
              ));
        }),
      )),
    );
  }
}
