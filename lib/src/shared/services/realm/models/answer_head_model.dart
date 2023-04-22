part of './generate/realm_models.dart';

@RealmModel()
class _AnswerHead {
  @PrimaryKey()
  late Uuid id;
  late List<_Answer> answers;
}
