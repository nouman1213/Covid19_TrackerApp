import 'dart:convert';



import 'package:covid_tracker_app/models/worl_state_model.dart';

import 'package:covid_tracker_app/services/utilities/appUrl.dart';
import 'package:http/http.dart' as http;

class WorldStatesViewModel {


  Future<WorldStatesModel> fetchWorldRecords() async {
    final response = await http.get(Uri.parse(AppUrl.worldStatesApi));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return WorldStatesModel.fromJson(data);
    } else {
      throw Exception('Error');
    }
  }

  Future<List<dynamic>> countriesListApi() async {
    var data ;
    final response = await http.get(Uri.parse(AppUrl.countriesList));
    print(response.statusCode.toString());
    print(data);
    if (response.statusCode == 200) {
       data = jsonDecode(response.body.toString());
      return data;
    } else {
      throw Exception('Error');
    }
  }

}