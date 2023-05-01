import '../../infra/services/realm/models/generate/realm_models.dart';

abstract class IInitialDataRepository {
  Future<Config> loadDataConfig();
  Future<Sync?> loadDataSyncStatus();
}
