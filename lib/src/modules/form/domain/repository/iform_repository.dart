import '../../../../shared/infra/services/realm/models/generate/realm_models.dart';

abstract class IFormRepository {
  Future<Forms> saveForm(Forms forms);
}
