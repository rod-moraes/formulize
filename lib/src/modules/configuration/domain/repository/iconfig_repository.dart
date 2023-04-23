import '../../../../shared/infra/services/realm/models/generate/realm_models.dart';

abstract class IConfigRepository {
  Future<Config> loadDataConfig();
  Future<Config> modifyPassUser(String newPassword, String oldPassword);
  Future<Config> saveDataConfig(String? themeModeName);
  Future<bool> validatePassUser(String password);
}
