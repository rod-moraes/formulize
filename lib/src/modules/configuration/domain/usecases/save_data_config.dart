import 'package:result_dart/result_dart.dart';

import '../../../../core/errors/failures.dart';
import '../../../../shared/infra/services/realm/models/generate/realm_models.dart';
import '../repository/iconfig_repository.dart';

abstract class ISaveDataConfig {
  Future<Result<Config, IFailure>> call(String themeModeName);
}

class SaveDataConfig implements ISaveDataConfig {
  final IConfigRepository repository;

  const SaveDataConfig(this.repository);
  @override
  Future<Result<Config, IFailure>> call(String themeModeName) async {
    try {
      final result = await repository.saveDataConfig(themeModeName);
      return Result.success(result);
    } on IFailure catch (error) {
      return error.toFailure();
    }
  }
}
