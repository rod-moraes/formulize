import 'package:realm/realm.dart';

import '../../../../shared/infra/services/realm/models/generate/realm_models.dart';
import '../../../../shared/infra/services/realm/realm_config.dart';
import '../../infra/datasource/iconfig_datasource.dart';

class ConfigLocalDatasource implements IConfigDatasource {
  final Realm realm;

  const ConfigLocalDatasource(this.realm);

  @override
  Future<Config> modifyPassUser(String newPassword, String oldPassword) async {
    final validate = await validatePassUser(oldPassword);
    if (!validate) throw 'Senha digitada inválida';
    _saveConfiguration(null, newPassword);
    return _getConfiguration();
  }

  @override
  Future<Config> saveDataConfig(String? themeModeName) async {
    _saveConfiguration(themeModeName, null);
    return _getConfiguration();
  }

  @override
  Future<bool> validatePassUser(String password) async {
    final config = _getConfiguration();
    if (config.superUserPass == password) {
      return true;
    }
    return false;
  }

  Config _getConfiguration() {
    return realm.query<Config>(r'id == $0', [auth.id]).single;
  }

  void _saveConfiguration(String? themeModeName, String? password) {
    final model = _getConfiguration();
    realm.write(() {
      model
        ..id = model.id
        ..themeModeName = themeModeName ?? model.themeModeName
        ..superUserPass = password ?? model.superUserPass;
    });
  }
}
