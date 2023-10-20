import 'package:equatable/equatable.dart';
import 'package:flutter_objectbox_demo/universities/model/university_db_model.dart';

class UniversityModel extends Equatable {
  final int id;
  final String? stateProvince;
  final String country;
  final List<String> domains;
  final List<String> webPages;
  final String alphaTwoCode;
  final String name;

  const UniversityModel({
    required this.id,
    this.stateProvince,
    required this.country,
    required this.domains,
    required this.webPages,
    required this.alphaTwoCode,
    required this.name,
  });

  @override
  List<Object?> get props =>
      [id, stateProvince, country, domains, webPages, alphaTwoCode, name];

  UniversityModel copyWith({
    int? id,
    String? stateProvince,
    String? country,
    List<String>? domains,
    List<String>? webPages,
    String? alphaTwoCode,
    String? name,
  }) {
    return UniversityModel(
      id: id ?? this.id,
      stateProvince: stateProvince ?? this.stateProvince,
      country: country ?? this.country,
      domains: domains ?? this.domains,
      webPages: webPages ?? this.webPages,
      alphaTwoCode: alphaTwoCode ?? this.alphaTwoCode,
      name: name ?? this.name,
    );
  }

  static UniversityModel? fromDBModel(UniversityDBModel dbModel) {
    try {
      return UniversityModel(
        id: dbModel.id,
        country: dbModel.country!,
        domains: dbModel.domains!,
        webPages: dbModel.webPages!,
        alphaTwoCode: dbModel.alphaTwoCode!,
        name: dbModel.name!,
        stateProvince: dbModel.stateProvince,
      );
    } catch (err) {
      return null;
    }
  }
}
