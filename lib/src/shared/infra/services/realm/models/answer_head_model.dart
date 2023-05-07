part of './generate/realm_models.dart';

@RealmModel()
class _AnswerHead {
  @PrimaryKey()
  @MapTo('_id')
  late Uuid id;
  late String idDevice;
  late String name;
  late String email;
  late List<_Answer> answers;
  bool isDeleted = false;
}
