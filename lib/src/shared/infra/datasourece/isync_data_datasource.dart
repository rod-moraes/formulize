import '../services/realm/models/generate/realm_models.dart';

abstract class ISyncDataDatasource {
  Future<Sync> syncData();
}
