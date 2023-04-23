import 'package:flutter_modular/flutter_modular.dart';

import 'domain/repository/iconfig_repository.dart';
import 'domain/usecases/load_data_config.dart';
import 'domain/usecases/modify_pass_user.dart';
import 'domain/usecases/save_data_config.dart';
import 'domain/usecases/validate_pass_user.dart';
import 'external/datasource/config_local_datasource.dart';
import 'infra/datasource/iconfig_datasource.dart';
import 'infra/repository/config_repository.dart';
import 'presenter/pages/configuration_page.dart';
import 'presenter/reducers/config_reducer.dart';

class ConfigurationModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        // datasource
        Bind.factory<IConfigDatasource>(
          (i) => ConfigLocalDatasource(i()),
        ),
        // repository
        Bind.factory<IConfigRepository>(
          (i) => ConfigRepository(i()),
        ),
        // usecases
        Bind.factory<ILoadDataConfig>(
          (i) => LoadDataConfig(i()),
        ),
        Bind.factory<IModifyPassUser>(
          (i) => ModifyPassUser(i()),
        ),
        Bind.factory<ISaveDataConfig>(
          (i) => SaveDataConfig(i()),
        ),
        Bind.factory<IValidatePassUser>(
          (i) => ValidatePassUser(i()),
        ),
        // reducers
        Bind.singleton<ConfigReducer>(
          (i) => ConfigReducer(
            i(),
            i(),
            i(),
            i(),
            i(),
          ),
        ),
      ];
  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, args) => const ConfigurationPage(),
        ),
      ];
}
