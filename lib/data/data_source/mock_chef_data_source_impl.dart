import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:recipe_app/data/data_source/chef_data_source.dart';
import 'package:recipe_app/domain/model/chef.dart';

class MockChefDataSourceImpl implements ChefDataSource {
  @override
  Future<List<Map<String, dynamic>>> getChefs() async {
    final String fileString = await rootBundle.loadString('assets/mock_data/chef.json');
    final Map<String, dynamic> json = jsonDecode(fileString);
    final List<dynamic> chefs = json['profiles'];
    return chefs.map((chef) => chef as Map<String, dynamic>).toList();
  }
}