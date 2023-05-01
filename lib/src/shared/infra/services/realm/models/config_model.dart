part of './generate/realm_models.dart';

@RealmModel()
class _Config {
  @PrimaryKey()
  @MapTo('_id')
  late String id;
  late String themeModeName;
  late String superUserPass;
}
