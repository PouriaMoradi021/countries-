import 'dart:convert';

import 'package:countries/core/resources/data-state.dart';
import 'package:countries/features/feature_countries/data/data_source/remote/api_provider.dart';
import 'package:countries/features/feature_countries/data/models/countries_model.dart';
import 'package:countries/features/feature_countries/domain/entities/countries_entity.dart';
import 'package:countries/features/feature_countries/domain/repository/countries_repository.dart';
import 'package:dio/dio.dart';

class CountriesRepositoryImpl extends CountriesRepository {
  ApiProvider apiProvider;

  CountriesRepositoryImpl(this.apiProvider);

  @override
  Future<List<CountriesEntities>> fetchCountriesData() async {
    try {
      Response response = await apiProvider.callCountries();
      print(response.statusCode);
      if (response.statusCode == 200) {
        print('Data is ::::${response.data.runtimeType}');
        print('Data is ::::${response.data}');

        final List<dynamic> jsonList = jsonDecode(response.data);
        print('Data is setted');


        return jsonList.map((dynamic item) =>
            CountriesModel.fromJson(item).toEntity()).toList();
      }
      else {
        print('else');

        return throw ('Something Went Wrong...!');
      }
    } catch (e,s) {
      print('else catch:$e');
      print('else catch:$s');

      return throw ('Please check your connection...!');
    }
  }
}

// class CountryRepository{
//   String url = 'https://raw.githubusercontent.com/esmaeil-ahmadipour/restcountries/main/json/countriesV2.json';
//   Future<List<CountryModel>> getCountries() async {
//     var response = await Dio().get(url);
//     if(response.statusCode == 200){
//       final List result = jsonDecode(response.data);
//       return result.map(((e) => CountryModel.fromJson(e))).toList();
//     }
//     else {
//       throw Exception(response.statusCode);
//     }
//   }
// }