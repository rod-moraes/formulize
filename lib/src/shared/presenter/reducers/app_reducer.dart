import 'package:flutter/material.dart';
import 'package:formulize/src/shared/domain/usecases/load_all_initial_config.dart';
import 'package:rx_notifier/rx_notifier.dart';
import '../atoms/app_atomic.dart';

class AppReducer extends RxReducer {
  final AppAtomic _appAtomic;
  final ILoadAllInitialConfig _loadAllInitialConfig;

  AppReducer(
    this._appAtomic,
    this._loadAllInitialConfig,
  ) {
    //actions
    on(() => [_appAtomic.init.value], _init);
  }

  Future<void> _init() async {
    final config = await _loadAllInitialConfig();
    config.fold(
      (success) {
        _appAtomic.themeMode.value = _getThemeModeByName(success.themeModeName);
        _appAtomic.saveThemeMode();
      },
      (failure) {},
    );
  }

  ThemeMode _getThemeModeByName(String name) {
    return ThemeMode.values.firstWhere((mode) => mode.name == name);
  }
}
