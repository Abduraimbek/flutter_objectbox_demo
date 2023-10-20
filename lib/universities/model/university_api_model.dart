class UniversityAPIModel {
  String? stateProvince;
  String? country;
  List<String>? domains;
  List<String>? webPages;
  String? alphaTwoCode;
  String? name;

  UniversityAPIModel({
    this.stateProvince,
    this.country,
    this.domains,
    this.webPages,
    this.alphaTwoCode,
    this.name,
  });

  factory UniversityAPIModel.fromMap(dynamic map) {
    return UniversityAPIModel(
      stateProvince: map['state-province'],
      country: map['country'],
      domains: map['domains']?.cast<String>(),
      webPages: map['web_pages']?.cast<String>(),
      alphaTwoCode: map['alpha_two_code'],
      name: map['name'],
    );
  }
}
