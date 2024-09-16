import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:lashamezvrishvili/pages/aggregate.dart';
import 'package:lashamezvrishvili/pages/delauneymx.dart';
import 'package:lashamezvrishvili/pages/gripwise.dart';
import 'package:lashamezvrishvili/pages/home.dart';
import 'package:lashamezvrishvili/pages/vacancies.dart';
import 'package:lashamezvrishvili/widgets/custom_page_route.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const routesList = {
    '/vacancies',
    '/aggregate',
    '/delauneymx',
    '/gripwise',
  };

  //Names of the routes

  static const routesNames = {
    'Vacancies',
    'Aggregate',
    'Delauney.mx',
    'Gripwise',
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lasha Mezvrishvili',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.dark(useMaterial3: true),
      themeMode: ThemeMode.light,
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        dragDevices: {
          PointerDeviceKind.mouse,
          PointerDeviceKind.touch,
          PointerDeviceKind.stylus,
        },
      ),
      onGenerateRoute: (RouteSettings settings) => CustomRoute(
          page: switch (settings.name) {
        '/' => const HomePage(),
        '/vacancies' => const VacanciesPage(),
        '/aggregate' => const AggregatePage(),
        '/delauneymx' => const DelauneyPage(),
        '/gripwise' => const GripwisePage(),
        _ => const Placeholder(),
      }),
    );
  }
}
