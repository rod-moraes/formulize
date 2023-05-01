import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rx_notifier/rx_notifier.dart';

class AppAtomic {
  // atoms
  final themeMode = RxNotifier<ThemeMode>(ThemeMode.system);
  final syncDate = RxNotifier<DateTime?>(null);
  final modifySuperUserPass = RxNotifier<String?>(null);
  final superUserPass = RxNotifier<String>('');
  final isValidateUser = RxNotifier<bool>(false);

  // computed
  String get syncDateText {
    final syncDate = this.syncDate.value;
    var syncDateText = 'Nunca';
    if (syncDate != null) {
      final format = DateFormat('dd/MM/yyyy - HH:mm:ss');
      syncDateText = format.format(syncDate.toLocal());
    }
    return syncDateText;
  }

  // actions
  final init = RxNotifier(null);
  final syncData = RxNotifier(null);
  final finishInit = RxNotifier(null);
  final saveThemeMode = RxNotifier(null);
  final validateSuperUserPass = RxNotifier(null);
  final blockedSuperUser = RxNotifier(null);
  final deleteApp = RxNotifier(null);
}
