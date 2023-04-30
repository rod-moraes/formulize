import 'package:formulize/src/modules/configuration/infra/datasource/iconfig_datasource.dart';
import 'package:formulize/src/shared/infra/services/realm/models/generate/realm_models.dart';

import '../../domain/repository/iconfig_repository.dart';

class ConfigRepository implements IConfigRepository {
  final IConfigDatasource datasource;
  const ConfigRepository(
    this.datasource,
  );
  @override
  Future<Config> modifyPassUser(String newPassword, String oldPassword) async =>
      datasource.modifyPassUser(newPassword, oldPassword);

  @override
  Future<Config> saveDataConfig(String? themeModeName) async =>
      datasource.saveDataConfig(themeModeName);

  @override
  Future<bool> validatePassUser(String password) async =>
      datasource.validatePassUser(password);
}
