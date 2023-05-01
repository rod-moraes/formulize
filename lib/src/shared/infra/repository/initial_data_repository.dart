import 'package:formulize/src/shared/infra/datasourece/iinitial_data_datasource.dart';
import 'package:formulize/src/shared/infra/services/realm/models/generate/realm_models.dart';

import '../../domain/repository/iinitial_data_repository.dart';

class InitialDataRepository implements IInitialDataRepository {
  final IInitialDataDatasource datasource;
  const InitialDataRepository(this.datasource);

  @override
  Future<Config> loadDataConfig() async => datasource.loadDataConfig();

  @override
  Future<Sync?> loadDataSyncStatus() async => datasource.loadDataSyncStatus();
}
