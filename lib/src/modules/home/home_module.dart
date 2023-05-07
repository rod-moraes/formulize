import 'package:flutter_modular/flutter_modular.dart';
import 'package:formulize/src/modules/home/presenter/atoms/home_atomic.dart';

import 'domain/repository/ihome_repository.dart';
import 'domain/usecases/get_forms.dart';
import 'external/datasource/home_datasource.dart';
import 'infra/datssource/ihome_datasource.dart';
import 'infra/respository/home_repository.dart';
import 'presenter/pages/home_page.dart';
import 'presenter/reducers/home_reducer.dart';

class HomeModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        // datasources
        Bind.factory<IHomeDatasource>(
          (i) => HomeDatasource(i()),
        ),

        // repositorys
        Bind.factory<IHomeRepository>(
          (i) => HomeRepository(i()),
        ),

        // usecases
        Bind.factory<IGetForms>((i) => GetForms(i())),

        // atoms
        Bind.singleton((i) => HomeAtomic()),

        // reducers
        Bind.singleton((i) => HomeReducer(i(), i())),
      ];
  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, args) => const HomePage(),
        ),
      ];
}
