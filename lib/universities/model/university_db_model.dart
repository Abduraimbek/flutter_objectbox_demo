import 'package:flutter_objectbox_demo/universities/model/university_api_model.dart';
import 'package:objectbox/objectbox.dart';

@Entity(uid: 1)
class UniversityDBModel {
  @Id()
  int id = 0;

  String? stateProvince;
  String? country;
  List<String>? domains;
  List<String>? webPages;
  String? alphaTwoCode;
  String? name;

  UniversityDBModel();

  factory UniversityDBModel.fromAPIModel(UniversityAPIModel apiModel) {
    return UniversityDBModel()
      ..stateProvince = apiModel.stateProvince
      ..country = apiModel.country
      ..domains = apiModel.domains
      ..webPages = apiModel.webPages
      ..alphaTwoCode = apiModel.alphaTwoCode
      ..name = apiModel.name;
  }
}
