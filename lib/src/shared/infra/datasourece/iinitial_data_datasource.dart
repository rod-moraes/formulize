import '../services/realm/models/generate/realm_models.dart';

abstract class IInitialDataDatasource {
  Future<Config> loadDataConfig();
  Future<Sync?> loadDataSyncStatus();
}
