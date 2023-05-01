import 'package:flutter/material.dart';
import 'package:formulize/src/shared/domain/usecases/load_all_initial_config.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:rx_notifier/rx_notifier.dart';
import '../../domain/usecases/load_all_initial_sync_status.dart';
import '../../domain/usecases/sync_data.dart';
import '../atoms/app_atomic.dart';

class AppReducer extends RxReducer {
  final AppAtomic _appAtomic;
  final ILoadAllInitialConfig _loadAllInitialConfig;
  final ILoadAllInitialSyncStatus _loadAllInitialSyncStatus;
  final ISyncData _syncData;

  AppReducer(
    this._appAtomic,
    this._loadAllInitialConfig,
    this._loadAllInitialSyncStatus,
    this._syncData,
  ) {
    //actions
    on(() => [_appAtomic.init.value], _init);
    on(() => [_appAtomic.syncData.value], _sync);
  }

  Future<void> _sync() async {
    globalLoaderContext.loaderOverlay.show();
    final syncResult = await _syncData();
    syncResult.fold(
      (success) {
        _appAtomic.syncDate.value = success.syncDate;
      },
      (failure) {},
    );
    globalLoaderContext.loaderOverlay.hide();
  }

  Future<void> _init() async {
    await _initConfig();
    await _initSyncStatus();
    _appAtomic.finishInit();
  }

  Future<void> _initSyncStatus() async {
    final syncStatus = await _loadAllInitialSyncStatus();
    syncStatus.fold(
      (success) {
        _appAtomic.syncDate.value = success.syncDate;
      },
      (failure) {},
    );
  }

  Future<void> _initConfig() async {
    final config = await _loadAllInitialConfig();
    config.fold(
      (success) {
        _appAtomic.themeMode.value = _getThemeModeByName(success.themeModeName);
      },
      (failure) {},
    );
  }

  ThemeMode _getThemeModeByName(String name) {
    return ThemeMode.values.firstWhere((mode) => mode.name == name);
  }
}
