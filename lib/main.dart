import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:lashamezvrishvili/pages/aggregate.dart';
import 'package:lashamezvrishvili/pages/home.dart';
import 'package:lashamezvrishvili/pages/terminal.dart';
import 'package:lashamezvrishvili/pages/vacancies.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const routes_list = {
    '/vacancies',
    '/aggregate',
    '/terminal',
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        dragDevices: {
          PointerDeviceKind.mouse,
          PointerDeviceKind.touch,
          PointerDeviceKind.stylus,
        },
      ),
      routes: {
        '/': (context) => const HomePage(),
        '/vacancies': (context) => const VacanciesPage(),
        '/aggregate': (context) => const AggregatePage(),
        '/terminal': (context) => const TerminalPage(),
      },
    );
  }
}
