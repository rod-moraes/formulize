part of './generate/realm_models.dart';

@RealmModel()
class _Forms {
  @PrimaryKey()
  @MapTo('_id')
  late Uuid id;
  late String idDevice;
  late String title;
  late _Status? status;
  late List<_Question> questions;
  late List<_AnswerHead> answers;
  bool isDeleted = false;
}
