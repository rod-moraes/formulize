part of './generate/realm_models.dart';

@RealmModel()
class _TypeQuestion {
  @PrimaryKey()
  late String id;
  late String title;
}
