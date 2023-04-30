import 'package:flutter_modular/flutter_modular.dart';
import 'package:formulize/src/modules/form/form_module.dart';
import 'package:formulize/src/shared/domain/usecases/load_all_initial_config.dart';
import 'package:formulize/src/shared/presenter/atoms/app_atomic.dart';
import 'package:realm/realm.dart';

import 'modules/configuration/configuration_module.dart';
import 'modules/home/home_module.dart';
import 'shared/domain/repository/iinitial_config_repository.dart';
import 'shared/external/datasource/initial_config_datasource.dart';
import 'shared/infra/datasourece/iinitial_config_datasource.dart';
import 'shared/infra/repository/initial_config_repository.dart';
import 'shared/infra/services/realm/realm_config.dart';
import 'shared/presenter/reducers/app_reducer.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        // services
        Bind.instance<Realm>(Realm(config)),
        // datasources
        Bind.factory<IInitialConfigDatasource>(
          (i) => InitialConfigDatasource(i()),
        ),
        // repositorys
        Bind.factory<IInitialConfigRepository>(
          (i) => InitialConfigRepository(i()),
        ),
        // usecases
        Bind.factory<ILoadAllInitialConfig>(
          (i) => LoadDataConfig(i()),
        ),
        // atoms
        Bind.singleton((i) => AppAtomic()),
        // reducers
        Bind.singleton(
          (i) => AppReducer(i(), i()),
        ),
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
