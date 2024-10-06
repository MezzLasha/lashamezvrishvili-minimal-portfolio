import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:lashamezvrishvili/pages_config.dart';
import 'package:lashamezvrishvili/widgets/custom_page_route.dart';
import 'package:lashamezvrishvili/widgets/page_skeleton/page_skeleton.dart';

import '/pages/home/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Lasha Mezvrishvili',
        theme: ThemeData(
          useMaterial3: true,
          textTheme: ThemeData.light().textTheme.apply(fontFamily: 'Neue'),
          fontFamily: 'Neue',
          pageTransitionsTheme: const PageTransitionsTheme(
            builders: {
              TargetPlatform.android: CustomRoute(),
              TargetPlatform.iOS: CustomRoute(),
              TargetPlatform.linux: CustomRoute(),
              TargetPlatform.macOS: CustomRoute(),
              TargetPlatform.windows: CustomRoute(),
            },
          ),
        ),
        debugShowCheckedModeBanner: false,
        darkTheme: ThemeData.dark(useMaterial3: true),
        themeMode: ThemeMode.light,
        scrollBehavior: const MaterialScrollBehavior().copyWith(
          dragDevices: {
            PointerDeviceKind.mouse,
            PointerDeviceKind.touch,
            PointerDeviceKind.stylus,
            PointerDeviceKind.trackpad,
          },
        ),
        routes: {
          '/': (context) => const HomePage(),
          ...{
            for (final page in pagesConfig) page.path: (context) => PageSkeleton(page),
          },
        },
        onUnknownRoute: (settings) => MaterialPageRoute(
          builder: (context) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        ),
      );
}
