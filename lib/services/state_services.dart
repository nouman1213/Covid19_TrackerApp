import 'dart:convert';

import 'package:covid_tracker_app/models/worl_state_model.dart';
import 'package:covid_tracker_app/services/utilities/appUrl.dart';
import 'package:http/http.dart' as http;

class StateServices {
  Future<WorldStatesModel > fetctStatesRecord() async {
    final response = await http.get(Uri.parse(AppUrl.worldStatesApi));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return WorldStatesModel .fromJson(data);
    } else {
      throw Exception('Error');
    }
  }

  Future<List<dynamic>> countryListApi() async {
    final response = await http.get(Uri.parse(AppUrl.countriesList));
    var data;
    if (response.statusCode == 200) {
      data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception('Error');
    }
  }
}
