import 'package:asuka/asuka.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:formulize/src/shared/presenter/atoms/app_atomic.dart';
import 'package:localization/localization.dart';
import 'package:rx_notifier/rx_notifier.dart';

import 'core/themes/themes.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({super.key});

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  final appAtomic = Modular.get<AppAtomic>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Modular
      ..setInitialRoute('/home/')
      ..setObservers([Asuka.asukaHeroController]);
    context.select(() => appAtomic.saveThemeMode.value);
    return MaterialApp.router(
      title: 'Formulize',
      debugShowCheckedModeBanner: false,
      themeMode: appAtomic.themeMode.value,
      theme: lightTheme,
      darkTheme: dartTheme,
      builder: Asuka.builder,
      routerDelegate: Modular.routerDelegate,
      routeInformationParser: Modular.routeInformationParser,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        LocalJsonLocalization.delegate,
      ],
      supportedLocales: const [
        Locale('pt', 'BR'),
      ],
    );
  }
}
