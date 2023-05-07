import 'package:realm/realm.dart';
import 'package:rx_notifier/rx_notifier.dart';

import '../../../../shared/infra/services/realm/models/generate/realm_models.dart';

class EditFormAtomic {
  // atoms
  final question = RxNotifier<Question?>(null);
  final questions = RxNotifier<List<Question>>([]);
  final title = RxNotifier<String>('');
  final status = RxNotifier<StatusForms>(StatusForms.active);
  final id = RxNotifier<Uuid?>(null);

  // computed
  Forms get forms => Forms(
        id.value ?? Uuid.v4(),
        title.value,
        status: status.value.toStatus,
        questions: questions.value,
      );

  // actions
  final saveData = RxNotifier(null);
}
