import 'dart:convert';

import 'package:flutter_objectbox_demo/common/db/db.dart';
import 'package:flutter_objectbox_demo/universities/model/university_api_model.dart';
import 'package:flutter_objectbox_demo/universities/model/university_db_model.dart';
import 'package:flutter_objectbox_demo/universities/model/university_model.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

class UniversitiesRepository {
  final logger = Logger();

  Future<List<UniversityAPIModel>> fetchUniversities() async {
    try {
      final uri = Uri.parse(
          'http://universities.hipolabs.com/search?country=Uzbekistan');

      final response = await http.get(uri);
      final parsed = jsonDecode(utf8.decode(response.bodyBytes)) as List;
      return parsed.map((e) => UniversityAPIModel.fromMap(e)).toList();
    } catch (err) {
      logger.e(err);
      throw 'Error while fetching.';
    }
  }

  Future<void> deleteAllUniversities() async {
    await store.box<UniversityDBModel>().removeAllAsync();
  }

  Future<void> saveUniversitiesIntoDB(List<UniversityAPIModel> apiList) async {
    final dbList =
        apiList.map((e) => UniversityDBModel.fromAPIModel(e)).toList();

    await store.box<UniversityDBModel>().putManyAsync(dbList);
  }

  Future<List<UniversityModel>> getUniversitiesFromDB() async {
    final dbList = await store.box<UniversityDBModel>().getAllAsync();
    final list = <UniversityModel>[];

    for (final dbModel in dbList) {
      final model = UniversityModel.fromDBModel(dbModel);
      if (model != null) {
        list.add(model);
      }
    }

    return list;
  }
}
