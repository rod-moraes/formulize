import 'package:formulize/src/core/errors/failures.dart';
import 'package:formulize/src/modules/configuration/domain/repository/iconfig_repository.dart';
import 'package:result_dart/result_dart.dart';

import '../../../../shared/infra/services/realm/models/generate/realm_models.dart';

abstract class ILoadDataConfig {
  Future<Result<Config, IFailure>> call();
}

class LoadDataConfig implements ILoadDataConfig {
  final IConfigRepository repository;
  const LoadDataConfig(
    this.repository,
  );

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
