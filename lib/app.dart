import 'package:flutter/material.dart';
import 'package:flutter_objectbox_demo/home/page/home_page.dart';
import 'package:flutter_objectbox_demo/testing_equatable/page/testing_equatable_page.dart';
import 'package:flutter_objectbox_demo/universities/page/universities_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      initialRoute: '/cars',
      routes: {
        HomePage.path: (context) => const HomePage(),
        UniversitiesPage.path: (context) => const UniversitiesPage(),
        '/cars': (context) => const TestingEquatablePage(),
      },
    );
  }
}
