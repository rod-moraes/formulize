import 'package:flutter_modular/flutter_modular.dart';
import 'package:formulize/src/modules/form/form_module.dart';
import 'package:formulize/src/shared/domain/usecases/load_all_initial_config.dart';
import 'package:formulize/src/shared/presenter/atoms/app_atomic.dart';
import 'package:realm/realm.dart';

import 'modules/configuration/configuration_module.dart';
import 'modules/home/home_module.dart';
import 'shared/domain/repository/iinitial_data_repository.dart';
import 'shared/domain/repository/isync_data_repository.dart';
import 'shared/domain/usecases/load_all_initial_sync_status.dart';
import 'shared/domain/usecases/sync_data.dart';
import 'shared/external/datasource/initial_data_datasource.dart';
import 'shared/external/datasource/sync_data_datasource.dart';
import 'shared/infra/datasourece/iinitial_data_datasource.dart';
import 'shared/infra/datasourece/isync_data_datasource.dart';
import 'shared/infra/repository/initial_data_repository.dart';
import 'shared/infra/repository/sync_data_repository.dart';
import 'shared/infra/services/realm/realm_config.dart';
import 'shared/presenter/reducers/app_reducer.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        // services
        AsyncBind<Realm>((i) async {
          final realm = await getRealmInstance();
          return realm;
        }),
        // datasources
        Bind.factory<IInitialDataDatasource>(
          (i) => InitialDataDatasource(i()),
        ),
        Bind.factory<ISyncDataDatasource>(
          (i) => SyncDataDatasource(i()),
        ),
        // repositorys
        Bind.factory<IInitialDataRepository>(
          (i) => InitialDataRepository(i()),
        ),
        Bind.factory<ISyncDataRepository>(
          (i) => SyncDataRepository(i()),
        ),
        // usecases
        Bind.factory<ILoadAllInitialConfig>(
          (i) => LoadDataConfig(i()),
        ),
        Bind.factory<ILoadAllInitialSyncStatus>(
          (i) => LoadDataSyncStatus(i()),
        ),
        Bind.factory<ISyncData>((i) => SyncData(i())),
        // atoms
        Bind.singleton((i) => AppAtomic()),
        // reducers
        AsyncBind<AppReducer>(
          (i) async => AppReducer(i(), i(), i(), i()),
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
