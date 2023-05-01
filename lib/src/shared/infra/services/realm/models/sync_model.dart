part of './generate/realm_models.dart';

@RealmModel()
class _Sync {
  @PrimaryKey()
  @MapTo('_id')
  late Uuid id;
  late String idDevice;
  late DateTime? syncDate;
  late String? status;
}
