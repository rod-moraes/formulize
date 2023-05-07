import 'package:flutter_modular/flutter_modular.dart';
import 'package:formulize/src/modules/form/presenter/pages/answer_form_page.dart';
import 'package:formulize/src/modules/form/presenter/pages/edit_form_page.dart';
import 'package:formulize/src/modules/form/presenter/pages/view_answers_page.dart';
import 'package:formulize/src/modules/form/presenter/reducers/edit_form_reducer.dart';

import 'domain/repository/iform_repository.dart';
import 'domain/usecases/save_form.dart';
import 'external/datasource/form_datasource.dart';
import 'infra/datasource/iform_datasource.dart';
import 'infra/repository/form_repository.dart';
import 'presenter/atoms/edit_form_atomic.dart';

class FormModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        // datasources
        Bind.factory<IFormDatasource>(
          (i) => FormDatasource(i()),
        ),

        // repositorys
        Bind.factory<IFormRepository>(
          (i) => FormRepository(i()),
        ),

        // usecases
        Bind.factory<ISaveForm>((i) => SaveForm(i())),

        // atoms
        Bind.singleton((i) => EditFormAtomic()),

        // reducers
        Bind.singleton((i) => EditFormReducer(i(), i())),
      ];
  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/edit',
          child: (context, args) => EditFormPage(forms: args.data),
        ),
        ChildRoute(
          '/new-answer',
          child: (context, args) => AnswerFormPage(forms: args.data),
        ),
        ChildRoute(
          '/view-answers',
          child: (context, args) => ViewAnswersPage(forms: args.data),
        ),
      ];
}
