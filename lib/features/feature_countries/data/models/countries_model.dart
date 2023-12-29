import 'package:countries/features/feature_countries/domain/entities/countries_entity.dart';

class CountriesModel extends CountriesEntities {
  CountriesModel(
      {required String name, required String capital, required String flag})
      : super(
          name: name,
          capital: capital,
          flag: flag,
        );

  factory CountriesModel.fromJson(Map<String, dynamic> json) {
    return CountriesModel(
      name: json['name'],
      capital: json['capital'],
      flag: json['flag'],
    );
  }

  CountriesModel toEntity() {
    return CountriesModel(
      name: name,
      capital: capital,
      flag: flag,
    );
  }
}
