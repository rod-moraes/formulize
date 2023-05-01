import 'package:formulize/src/shared/infra/services/realm/models/generate/realm_models.dart';
import 'package:realm/realm.dart';

import '../../infra/datasourece/isync_data_datasource.dart';
import '../../infra/services/realm/realm_config.dart';

class SyncDataDatasource implements ISyncDataDatasource {
  final Realm realm;
  const SyncDataDatasource(this.realm);

  @override
  Future<Sync> syncData() async {
    final getUser = await user;
    final syncModel = realm.write(
      () => realm.add(Sync(Uuid.v4(), getUser.id, syncDate: DateTime.now())),
    );
    realm.syncSession.resume();
    await realm.syncSession.waitForDownload();
    await realm.syncSession.waitForUpload();
    realm.syncSession.pause();
    return syncModel;
  }
}
