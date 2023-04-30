import '../../infra/services/realm/models/generate/realm_models.dart';

abstract class IInitialConfigRepository {
  Future<Config> loadDataConfig();
}
