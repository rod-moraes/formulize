import 'package:formulize/src/shared/infra/services/realm/models/generate/realm_models.dart';
import 'package:realm/realm.dart';

import '../../infra/datssource/ihome_datasource.dart';

class HomeDatasource implements IHomeDatasource {
  final Realm realm;
  const HomeDatasource(this.realm);

  @override
  Future<List<Forms>> getForms(StatusForms? status) async {
    if (status == null) {
      return realm.all<Forms>().toList();
    }
    return realm.query<Forms>('status.id == "${status.toStatus.id}"').toList();
  }
}
