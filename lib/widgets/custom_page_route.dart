import 'package:flutter/material.dart';

class CustomRoute extends PageRouteBuilder {
  final Widget page;

  CustomRoute({required this.page})
      : super(
          transitionDuration: const Duration(milliseconds: 400),
          transitionsBuilder: (BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              Widget child) {
            return FadeTransition(
              opacity: CurvedAnimation(
                  parent: animation, curve: Curves.easeInOutCubicEmphasized),
              child: child,
            );
          },
          pageBuilder: (BuildContext context, Animation<double> animation,
              Animation<double> secondaryAnimation) {
            return page;
          },
        );
}

class CustomRectTween extends RectTween {
  CustomRectTween({required this.a, required this.b}) : super(begin: a, end: b);
  final Rect a;
  final Rect b;

  @override
  Rect lerp(double t) {
    Curves.easeInOutCubicEmphasized.transform(t);
    //any curve can be applied here e.g. Curve.elasticOut.transform(t);
    final verticalDist = Curves.easeInOutCubicEmphasized.transform(t);

    final top = lerpDouble(a.top, b.top, t)! * (1 - verticalDist);
    return Rect.fromLTRB(
      lerpDouble(a.left, b.left, t)!,
      top,
      lerpDouble(a.right, b.right, t)!,
      lerpDouble(a.bottom, b.bottom, t)!,
    );
  }

  double? lerpDouble(num a, num b, double t) {
    if (a == null && b == null) return null;
    return a + (b - a) * t;
  }
}
