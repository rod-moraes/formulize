import 'package:flutter_modular/flutter_modular.dart';
import 'package:formulize/src/modules/form/presenter/pages/edit_form_page.dart';

class FormModule extends Module {
  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/edit',
          child: (context, args) => const EditFormPage(),
        ),
      ];
}
