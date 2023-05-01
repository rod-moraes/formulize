import 'package:formulize/src/shared/infra/services/realm/models/generate/realm_models.dart';
import 'package:realm/realm.dart';

import '../../infra/datasourece/iinitial_data_datasource.dart';

class InitialDataDatasource implements IInitialDataDatasource {
  final Realm realm;
  const InitialDataDatasource(this.realm);

  @override
  Future<Config> loadDataConfig() async {
    return _getConfiguration();
  }

  @override
  Future<Sync?> loadDataSyncStatus() async {
    return _getSyncStatus();
  }

  Sync? _getSyncStatus() {
    return realm
        .query<Sync>('TRUEPREDICATE SORT(syncDate DESC) LIMIT(1)')
        .single;
  }

  Config _getConfiguration() {
    return realm.all<Config>().single;
  }
}
