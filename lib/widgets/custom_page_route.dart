import 'package:flutter/material.dart';

class CustomRoute extends PageTransitionsBuilder {
  const CustomRoute();

  @override
  Widget buildTransitions<T>(route, context, animation, secondaryAnimation, child) {
    return
        //  ScaleTransition(
        //   scale: animation.drive(
        //     Tween<double>(
        //       begin: 0.0,
        //       end: 1.0,
        //     ).chain(
        //       CurveTween(curve: Easing.standard),
        //     ),
        //   ),
        // child:
        FadeTransition(
      opacity: animation,
      child: child,
      // ),
    );
  }
}
