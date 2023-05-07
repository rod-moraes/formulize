import 'package:formulize/src/modules/home/infra/datssource/ihome_datasource.dart';
import 'package:formulize/src/shared/infra/services/realm/models/generate/realm_models.dart';

import '../../domain/repository/ihome_repository.dart';

class HomeRepository implements IHomeRepository {
  final IHomeDatasource datasource;
  const HomeRepository(this.datasource);

  @override
  Future<List<Forms>> getForms(StatusForms? status) async =>
      datasource.getForms(status);
}
