import 'package:formulize/src/shared/infra/services/realm/models/generate/realm_models.dart';

import '../../domain/repository/isync_data_repository.dart';
import '../datasourece/isync_data_datasource.dart';

class SyncDataRepository implements ISyncDataRepository {
  final ISyncDataDatasource datasource;
  const SyncDataRepository(this.datasource);

  @override
  Future<Sync> syncData() async => datasource.syncData();
}
