import 'package:formulize/src/shared/infra/services/realm/models/generate/realm_models.dart';
import 'package:realm/realm.dart';

import '../../infra/datasource/iform_datasource.dart';

class FormDatasource implements IFormDatasource {
  final Realm realm;
  const FormDatasource(this.realm);

  @override
  Future<Forms> saveForm(Forms forms) async {
    return realm.write(() => realm.add(forms, update: true));
  }
}
