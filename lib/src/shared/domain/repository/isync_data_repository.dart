import '../../infra/services/realm/models/generate/realm_models.dart';

abstract class ISyncDataRepository {
  Future<Sync> syncData();
}
