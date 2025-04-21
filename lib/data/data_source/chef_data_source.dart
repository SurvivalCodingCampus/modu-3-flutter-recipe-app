// lib/data/datasource/chef_datasource.dart
import 'package:recipe_app/domain/entity/chef.dart';


abstract class ChefDataSource {
  /// 모든 셰프 프로필 정보를 가져옵니다.
  Future<List<Chef>> getAllChefs();
  
  /// 특정 ID의 셰프 정보를 가져옵니다.
  Future<Chef?> getChefById(int id);
  
  /// 특정 주소(도시 또는 국가)의 셰프 목록을 가져옵니다.
  Future<List<Chef>> getChefsByLocation(String location);
}

  