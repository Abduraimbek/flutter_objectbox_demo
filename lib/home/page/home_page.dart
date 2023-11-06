import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_objectbox_demo/common/cache/cache.dart';
import 'package:flutter_objectbox_demo/common/cache/src/objectbox_cache.dart';
import 'package:flutter_objectbox_demo/common/db/db.dart';
import 'package:flutter_objectbox_demo/universities/page/universities_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static const path = '/';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late TextEditingController textEditingController;
  StreamSubscription? listenter;
  String? text;
  int? count;

  @override
  void initState() {
    super.initState();

    textEditingController = TextEditingController();

    listenter =
        store.box<ObjectboxCacheModel>().query().watch().listen((event) {
      if (mounted) {
        text = event.findFirst()?.valueString;
        count = event.count();
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    listenter?.cancel();
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(UniversitiesPage.path);
                },
                child: const Text('To Universities Page'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Value: $text\nCount: $count'),
              ),
              TextField(controller: textEditingController),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () async {
                    cache.setString('theKey', textEditingController.text);
                  },
                  child: const Text('Save'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
