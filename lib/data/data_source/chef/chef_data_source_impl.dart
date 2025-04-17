
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:recipe_app/data/data_source/chef/chef_data_source.dart';
import 'package:recipe_app/data/model/chef.dart';

class ChefDataSourceImpl implements ChefDataSource {
  static const String _url = 'https://raw.githubusercontent.com/junsuk5/mock_json/main/recipe/chef.json';

  @override
  Future<List<Chef>> getChefProfiles() async {
    final response = await http.get(Uri.parse(_url));

    if (response.statusCode == 200) {
      final decode = jsonDecode(response.body);
      final List<dynamic> chefProfile = decode['profiles'];
      return chefProfile.map((e) => Chef.fromJson(e)).toList();
    } else {
      throw Exception('Chef Data Source');
    }

  }


}