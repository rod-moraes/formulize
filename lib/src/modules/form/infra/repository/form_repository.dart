import 'package:formulize/src/modules/form/infra/datasource/iform_datasource.dart';
import 'package:formulize/src/shared/infra/services/realm/models/generate/realm_models.dart';

import '../../domain/repository/iform_repository.dart';

class FormRepository implements IFormRepository {
  final IFormDatasource datasource;
  const FormRepository(this.datasource);

  @override
  Future<Forms> saveForm(Forms forms) async => datasource.saveForm(forms);
}
