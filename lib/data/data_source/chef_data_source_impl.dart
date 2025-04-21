// lib/data/datasource/chef_datasource_impl.dart
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:recipe_app/data/data_source/chef_data_source.dart';
import 'package:recipe_app/domain/entity/chef.dart';


class ChefDataSourceImpl implements ChefDataSource {
  // 메모리 캐싱을 위한 변수
  List<Chef>? _cachedChefs;
  
  @override
  Future<List<Chef>> getAllChefs() async {
    // 캐시된 데이터가 있으면 반환
    if (_cachedChefs != null) {
      return _cachedChefs!;
    }
    
    try {
      // chef.json 파일에서 데이터 로드
      final String jsonString = await rootBundle.loadString('assets/chef.json');
      final Map<String, dynamic> jsonData = json.decode(jsonString);
      
      List<dynamic> chefsJson = jsonData['profiles'];
      _cachedChefs = chefsJson.map((chefJson) => Chef.fromJson(chefJson)).toList();
      
      return _cachedChefs!;
    } catch (e) {
      debugPrint('셰프 데이터 로딩 오류: $e');
      return [];
    }
  } 
  
  @override
  Future<Chef?> getChefById(int id) async {
    final chefs = await getAllChefs();
    try {
      return chefs.firstWhere((chef) => chef.id == id);
    } catch (e) {
      return null; // ID에 해당하는 셰프가 없을 경우
    }
  }
  
  @override
  Future<List<Chef>> getChefsByLocation(String location) async {
    final chefs = await getAllChefs();
    return chefs.where((chef) => 
      chef.address.toLowerCase().contains(location.toLowerCase())
    ).toList();
  }
}