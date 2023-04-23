import 'package:formulize/src/core/errors/failures.dart';
import 'package:result_dart/result_dart.dart';

import '../../../../shared/infra/services/realm/models/generate/realm_models.dart';
import '../repository/iconfig_repository.dart';

abstract class IModifyPassUser {
  Future<Result<Config, IFailure>> call(String newPassword, String oldPassword);
}

class ModifyPassUser implements IModifyPassUser {
  final IConfigRepository repository;

  const ModifyPassUser(this.repository);

  @override
  Future<Result<Config, IFailure>> call(
    String newPassword,
    String oldPassword,
  ) async {
    try {
      final result = await repository.modifyPassUser(newPassword, oldPassword);
      return Result.success(result);
    } on IFailure catch (error) {
      return error.toFailure();
    }
  }
}
