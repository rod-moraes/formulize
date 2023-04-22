part of './generate/realm_models.dart';

@RealmModel()
class _Forms {
  @PrimaryKey()
  late Uuid id;
  late String title;
  late _Status? status;
  late List<_Question> questions;
  late List<_AnswerHead> answers;
}
