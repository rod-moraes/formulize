import '../../../../shared/infra/services/realm/models/generate/realm_models.dart';

abstract class IHomeRepository {
  Future<List<Forms>> getForms(StatusForms? status);
}
