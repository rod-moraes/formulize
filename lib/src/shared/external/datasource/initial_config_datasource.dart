import 'package:formulize/src/shared/infra/services/realm/models/generate/realm_models.dart';
import 'package:realm/realm.dart';

import '../../infra/datasourece/iinitial_config_datasource.dart';

class InitialConfigDatasource implements IInitialConfigDatasource {
  final Realm realm;
  const InitialConfigDatasource(this.realm);

  @override
  Future<Config> loadDataConfig() async {
    return _getConfiguration();
  }

  Config _getConfiguration() {
    return realm.all<Config>().single;
  }
}
