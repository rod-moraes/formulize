import '../../../../shared/infra/services/realm/models/generate/realm_models.dart';

abstract class IFormDatasource {
  Future<Forms> saveForm(Forms forms);
}
