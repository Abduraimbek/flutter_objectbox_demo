import 'package:flutter/material.dart';
import 'package:flutter_objectbox_demo/app.dart';
import 'package:flutter_objectbox_demo/common/db/db.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initializeObjectboxStore();

  runApp(const App());
}
