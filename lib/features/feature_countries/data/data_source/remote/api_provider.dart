import 'dart:convert';

import 'package:countries/core/utils/constants.dart';
import 'package:countries/features/feature_countries/data/models/countries_model.dart';
import 'package:dio/dio.dart';

class ApiProvider {
  final Dio _dio = Dio();

  Future<dynamic> callCountries() async {
    var response = await _dio.get(Constants.baseUrl);
    print(response.data);

    return response;
  }
}
