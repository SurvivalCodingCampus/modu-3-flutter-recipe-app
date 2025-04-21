import 'package:recipe_app/data/data_source/chef_data_source.dart';
import 'package:recipe_app/domain/model/chef.dart';
import 'package:recipe_app/domain/repository/chef_repository.dart';

class ChefRepositoryImpl implements ChefRepository {
  final ChefDataSource _chefDataSource;

  const ChefRepositoryImpl({
    required ChefDataSource chefDataSource,
  }) : _chefDataSource = chefDataSource;

  @override
  Future<List<Chef>> getChefs() async {
    final List<Map<String, dynamic>> chefs = await _chefDataSource.getChefs();
    return chefs.map((chef) => Chef.fromJson(chef)).toList();
  }
}