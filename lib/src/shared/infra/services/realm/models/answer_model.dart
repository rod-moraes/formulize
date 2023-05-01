part of './generate/realm_models.dart';

@RealmModel()
class _Answer {
  @PrimaryKey()
  @MapTo('_id')
  late Uuid id;
  late _Question? question;
  late String answer;
  late List<String> answers;
  bool isDeleted = false;
}
