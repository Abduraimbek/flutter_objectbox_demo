import 'package:flutter_objectbox_demo/objectbox.g.dart';

Future<void> initializeObjectboxStore() async {
  store = await openStore();
}

late final Store store;
