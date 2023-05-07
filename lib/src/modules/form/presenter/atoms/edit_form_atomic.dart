import 'package:realm/realm.dart';
import 'package:rx_notifier/rx_notifier.dart';

import '../../../../shared/infra/services/realm/models/generate/realm_models.dart';
import '../../../../shared/infra/services/realm/realm_config.dart';

class EditFormAtomic {
  // atoms
  final question = RxNotifier<Question?>(null);
  final questions = RxNotifier<List<Question>>([]);
  final answer = RxNotifier<List<AnswerHead>>([]);
  final title = RxNotifier<String>('');
  final status = RxNotifier<StatusForms>(StatusForms.active);
  final id = RxNotifier<Uuid?>(null);
  final answerEdit = RxNotifier<AnswerHead>(
    AnswerHead(
      Uuid.v4(),
      auth.id,
      '',
      '',
    ),
  );

  // computed
  Forms get forms => Forms(
        id.value ?? Uuid.v4(),
        auth.id,
        title.value,
        status: status.value.toStatus,
        questions: questions.value,
        answers: answer.value,
      );

  // actions
  final saveData = RxNotifier(null);
  final saveNewAnswerData = RxNotifier(null);
}
