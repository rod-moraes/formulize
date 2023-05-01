import 'package:formulize/src/core/errors/failures.dart';
import 'package:formulize/src/shared/infra/services/realm/models/generate/realm_models.dart';
import 'package:realm/realm.dart';
import 'package:result_dart/result_dart.dart';

import '../../infra/services/realm/realm_config.dart';
import '../repository/iinitial_data_repository.dart';

abstract class ILoadAllInitialSyncStatus {
  Future<Result<Sync, IFailure>> call();
}

class LoadDataSyncStatus implements ILoadAllInitialSyncStatus {
  final IInitialDataRepository repository;
  const LoadDataSyncStatus(this.repository);

  @override
  Future<Result<Sync, IFailure>> call() async {
    try {
      final syncStatus = await repository.loadDataSyncStatus();
      if (syncStatus == null) {
        return Sync(Uuid.nil, auth.id).toSuccess();
      }
      return syncStatus.toSuccess();
    } on IFailure catch (error) {
      return error.toFailure();
    }
  }
}
