part of './generate/realm_models.dart';

@RealmModel()
class _Status {
  @PrimaryKey()
  late Uuid id;
  late String title;
}
