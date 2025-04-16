

import 'package:recipe_app/data/data_source/chef/chef_data_source.dart';
import 'package:recipe_app/data/model/chef.dart';
import 'package:recipe_app/data/repository/chef/chef_repository.dart';

class ChefRepositoryImpl implements ChefRepository {
  final ChefDataSource _chefDataSource;

  ChefRepositoryImpl(this._chefDataSource);

  @override
  Future<List<Chef>> getChefProfiles() async {
    final chefProfile = await _chefDataSource.getChefProfiles();
    return chefProfile;
  }
}