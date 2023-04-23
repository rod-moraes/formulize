import 'package:realm/realm.dart';

import 'models/generate/realm_models.dart';

LocalConfiguration config = Configuration.local(
  [
    Sync.schema,
    Config.schema,
    Status.schema,
    TypeQuestion.schema,
    Question.schema,
    Answer.schema,
    AnswerHead.schema,
    Forms.schema,
  ],
  initialDataCallback: (realm) {
    realm.add(Config('system', '12345'));
    for (final status in StatusForms.values) {
      realm.add(Status(status.id, status.title));
    }
    for (final typeQuestion in TypeQuestionForms.values) {
      realm.add(TypeQuestion(typeQuestion.id, typeQuestion.name));
    }
  },
);
