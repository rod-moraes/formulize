part of './generate/realm_models.dart';

@RealmModel()
class _Answer {
  @PrimaryKey()
  late Uuid id;
  late _Question? question;
  late String answer;
  late List<String> answers;
}
