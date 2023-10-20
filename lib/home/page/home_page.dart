import 'package:flutter/material.dart';
import 'package:flutter_objectbox_demo/universities/page/universities_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const path = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushNamed(UniversitiesPage.path);
          },
          child: const Text('To Universities Page'),
        ),
      ),
    );
  }
}
