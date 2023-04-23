import 'package:flutter_modular/flutter_modular.dart';
import 'package:formulize/src/modules/form/form_module.dart';
import 'package:formulize/src/shared/presenter/atoms/app_atomic.dart';
import 'package:realm/realm.dart';

import 'modules/configuration/configuration_module.dart';
import 'modules/home/home_module.dart';
import 'shared/infra/services/realm/realm_config.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.instance<Realm>(Realm(config)),
        Bind.singleton((i) => AppAtomic()),
      ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute(
          '/home',
          module: HomeModule(),
        ),
        ModuleRoute(
          '/form',
          module: FormModule(),
        ),
        ModuleRoute(
          '/config',
          module: ConfigurationModule(),
        )
      ];
}
