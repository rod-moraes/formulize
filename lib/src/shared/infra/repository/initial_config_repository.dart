import 'package:formulize/src/shared/infra/datasourece/iinitial_config_datasource.dart';
import 'package:formulize/src/shared/infra/services/realm/models/generate/realm_models.dart';

import '../../domain/repository/iinitial_config_repository.dart';

class InitialConfigRepository implements IInitialConfigRepository {
  final IInitialConfigDatasource datasource;
  const InitialConfigRepository(this.datasource);

  @override
  Future<Config> loadDataConfig() async => datasource.loadDataConfig();
}
