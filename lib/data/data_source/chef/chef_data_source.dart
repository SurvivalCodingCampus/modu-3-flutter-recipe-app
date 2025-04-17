import '../../model/chef.dart';

abstract interface class ChefDataSource {
  Future<List<Chef>> getChefProfiles();

}