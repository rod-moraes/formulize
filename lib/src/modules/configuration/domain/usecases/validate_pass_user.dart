import 'package:formulize/src/core/errors/failures.dart';
import 'package:result_dart/result_dart.dart';

import '../repository/iconfig_repository.dart';

abstract class IValidatePassUser {
  Future<Result<bool, IFailure>> call(String password);
}

class ValidatePassUser implements IValidatePassUser {
  final IConfigRepository repository;
  const ValidatePassUser(this.repository);

  @override
  Future<Result<bool, IFailure>> call(String password) async {
    try {
      final result = await repository.validatePassUser(password);
      return Result.success(result);
    } on IFailure catch (error) {
      return error.toFailure();
    }
  }
}
