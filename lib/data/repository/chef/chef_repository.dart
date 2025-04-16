
import '../../model/chef.dart';

abstract interface class ChefRepository {
  Future<List<Chef>> getChefProfiles();

}