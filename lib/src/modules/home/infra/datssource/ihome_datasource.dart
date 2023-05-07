import '../../../../shared/infra/services/realm/models/generate/realm_models.dart';

abstract class IHomeDatasource {
  Future<List<Forms>> getForms(StatusForms? status);
}
