import 'package:formulize/src/core/errors/failures.dart';
import 'package:formulize/src/shared/infra/services/realm/models/generate/realm_models.dart';
import 'package:result_dart/result_dart.dart';

import '../repository/iinitial_data_repository.dart';

abstract class ILoadAllInitialConfig {
  Future<Result<Config, IFailure>> call();
}

class LoadDataConfig implements ILoadAllInitialConfig {
  final IInitialDataRepository repository;
  const LoadDataConfig(this.repository);

  @override
  Future<Result<Config, IFailure>> call() async {
    try {
      final config = await repository.loadDataConfig();
      return config.toSuccess();
    } on IFailure catch (error) {
      return error.toFailure();
    }
  }
}
