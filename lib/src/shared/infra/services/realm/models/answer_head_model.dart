part of './generate/realm_models.dart';

@RealmModel()
class _AnswerHead {
  @PrimaryKey()
  late Uuid id;
  late String name;
  late String email;
  late List<_Answer> answers;
}
