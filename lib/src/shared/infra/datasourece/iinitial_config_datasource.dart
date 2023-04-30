import '../services/realm/models/generate/realm_models.dart';

abstract class IInitialConfigDatasource {
  Future<Config> loadDataConfig();
}
