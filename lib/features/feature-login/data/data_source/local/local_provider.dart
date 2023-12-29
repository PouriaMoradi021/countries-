import 'dart:convert';
import 'dart:core';


import 'package:countries/core/utils/constants.dart';

import 'package:flutter/services.dart';

class LocalProvider {

  Future<List<dynamic>> readUsers() async {
    final jsonData = await rootBundle.loadString(Constants.localUrl);
    final list = await json.decode(jsonData) as List<dynamic>;
    print(List);
    return list;
  }
}
