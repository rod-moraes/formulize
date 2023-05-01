import 'package:formulize/src/core/errors/failures.dart';
import 'package:formulize/src/shared/infra/services/realm/models/generate/realm_models.dart';
import 'package:result_dart/result_dart.dart';

import '../repository/isync_data_repository.dart';

abstract class ISyncData {
  Future<Result<Sync, IFailure>> call();
}

class SyncData implements ISyncData {
  final ISyncDataRepository repository;
  const SyncData(this.repository);

  @override
  Future<Result<Sync, IFailure>> call() async {
    try {
      final sync = await repository.syncData();
      return sync.toSuccess();
    } on IFailure catch (error) {
      return error.toFailure();
    }
  }
}
