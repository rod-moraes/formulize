part of './generate/realm_models.dart';

@RealmModel()
class _Question {
  @PrimaryKey()
  @MapTo('_id')
  late Uuid id;
  late String hint;
  late String label;
  late _TypeQuestion? type;
  bool isDeleted = false;
}
