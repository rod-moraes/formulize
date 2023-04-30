import 'package:asuka/asuka.dart';
import 'package:formulize/src/modules/configuration/domain/usecases/modify_pass_user.dart';
import 'package:formulize/src/modules/configuration/domain/usecases/save_data_config.dart';
import 'package:formulize/src/modules/configuration/domain/usecases/validate_pass_user.dart';
import 'package:rx_notifier/rx_notifier.dart';

import '../../../../shared/presenter/atoms/app_atomic.dart';

class ConfigReducer extends RxReducer {
  final AppAtomic appAtomic;
  final IModifyPassUser _modifyPassUser;
  final ISaveDataConfig _saveDataConfig;
  final IValidatePassUser _validatePassUser;

  ConfigReducer(
    this.appAtomic,
    this._modifyPassUser,
    this._saveDataConfig,
    this._validatePassUser,
  ) {
    //actions
    on(() => [appAtomic.deleteApp.value], _deleteApp);
    on(() => [appAtomic.validateSuperUserPass.value], _validateSuperUserPass);
    on(() => [appAtomic.blockedSuperUser.value], _blockedSuperUser);
    //atoms
    on(() => [appAtomic.saveThemeMode.value], _saveThemeMode);
    on(() => [appAtomic.modifySuperUserPass.value], _saveSuperUserPass);
  }

  void _deleteApp() {}

  Future<void> _blockedSuperUser() async {
    appAtomic.isValidateUser.value = false;
  }

  Future<void> _validateSuperUserPass() async {
    final password = appAtomic.superUserPass.value;
    final result = await _validatePassUser(password);
    result.fold(
      (success) {
        appAtomic.isValidateUser.value = success;
        Asuka.removeCurrentSnackBar();
        if (success) {
          AsukaSnackbar.success('Usuário desbloqueado com sucesso').show();
        } else {
          AsukaSnackbar.alert('Senha incorreta!').show();
        }
      },
      (failure) {
        Asuka.removeCurrentSnackBar();
        AsukaSnackbar.alert(failure.message).show();
      },
    );
  }

  Future<void> _saveThemeMode() async {
    final themeMode = appAtomic.themeMode.value;
    final result = await _saveDataConfig(themeMode.name);
    result.fold(
      (success) {
        Asuka.removeCurrentSnackBar();
        AsukaSnackbar.success('Sucesso na alteração de tema!').show();
      },
      (failure) {
        Asuka.removeCurrentSnackBar();
        AsukaSnackbar.alert(failure.message).show();
      },
    );
  }

  Future<void> _saveSuperUserPass() async {
    final newPassword = appAtomic.modifySuperUserPass.value ?? '';
    final oldPassword = appAtomic.superUserPass.value;
    final isValidate = appAtomic.isValidateUser.value;

    if (!isValidate || oldPassword.isEmpty) {
      Asuka.removeCurrentSnackBar();
      AsukaSnackbar.alert('Desbloqueie o super usuário antes!').show();
    }

    final result = await _modifyPassUser(newPassword, oldPassword);
    result.fold(
      (success) {
        Asuka.removeCurrentSnackBar();
        AsukaSnackbar.success('Sucesso na alteração de senha!').show();
      },
      (failure) {
        Asuka.removeCurrentSnackBar();
        AsukaSnackbar.alert(failure.message).show();
      },
    );
  }
}
