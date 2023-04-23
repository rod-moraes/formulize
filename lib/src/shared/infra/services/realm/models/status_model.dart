part of './generate/realm_models.dart';

@RealmModel()
class _Status {
  @PrimaryKey()
  late String id;
  late String title;
}

enum StatusForms {
  active('1', 'Ativo'),
  inactive('2', 'Inativo');

  final String id;
  final String title;
  const StatusForms(this.id, this.title);

  Status get toStatus {
    return Status(id, title);
  }
}
