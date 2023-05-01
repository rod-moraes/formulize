import 'package:asuka/asuka.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:formulize/src/shared/presenter/atoms/app_atomic.dart';
import 'package:intl/intl.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:localization/localization.dart';
import 'package:rx_notifier/rx_notifier.dart';

import 'app_module.dart';
import 'core/themes/themes.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({super.key});

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  final AppAtomic appAtomic = Modular.get<AppAtomic>();

  late final Future<void> future;

  Future<void> frameFuture() async {
    Modular
      ..setInitialRoute('/home/')
      ..setObservers([Asuka.asukaHeroController]);
    await Modular.isModuleReady<AppModule>();
    Modular.get<AppAtomic>().init();
  }

  @override
  void initState() {
    super.initState();
    Intl.defaultLocale = 'pt_BR';

    future = frameFuture();
  }

  @override
  Widget build(BuildContext context) {
    context
      ..select(() => appAtomic.saveThemeMode.value)
      ..select(() => appAtomic.finishInit.value);
    return FutureBuilder(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp.router(
            title: 'Formulize',
            debugShowCheckedModeBanner: false,
            themeMode: appAtomic.themeMode.value,
            theme: lightTheme,
            darkTheme: dartTheme,
            builder: (context, widget) => Asuka.builder(
              context,
              globalLoaderContext.builder(context, widget),
            ),
            routerDelegate: Modular.routerDelegate,
            routeInformationParser: Modular.routeInformationParser,
            localizationsDelegates: [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              LocalJsonLocalization.delegate,
            ],
            locale: const Locale('pt', 'BR'),
            supportedLocales: const [
              Locale('pt', 'BR'),
            ],
            localeResolutionCallback: (locale, supportedLocales) {
              return const Locale('pt', 'BR');
            },
          );
        }

        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
