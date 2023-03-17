import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:lashamezvrishvili/pages/aggregate.dart';
import 'package:lashamezvrishvili/pages/home.dart';
import 'package:lashamezvrishvili/pages/terminal.dart';
import 'package:lashamezvrishvili/pages/vacancies.dart';
import 'package:lashamezvrishvili/widgets/custom_page_route.dart';

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

  //Names of the routes

  static const routes_names = {
    'Vacancies',
    'Aggregate',
    'Terminal',
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
      onGenerateRoute: (RouteSettings settings) {
        Widget page;
        switch (settings.name) {
          case '/':
            page = const HomePage();
            break;
          case '/vacancies':
            page = const VacanciesPage();
            break;
          case '/aggregate':
            page = const AggregatePage();
            break;
          case '/terminal':
            page = const TerminalPage();
            break;
          // Add more cases for additional named routes
          default:
            return null;
        }
        return CustomRoute(page: page);
      },
      // routes: {
      //   '/': (context) => const HomePage(),
      //   '/vacancies': (context) => const VacanciesPage(),
      //   '/aggregate': (context) => const AggregatePage(),
      //   '/terminal': (context) => const TerminalPage(),
      // },
    );
  }
}
