import 'package:recipe_app/domain/model/chef.dart';

abstract interface class ChefRepository {
  Future<List<Chef>> getChefs();
}