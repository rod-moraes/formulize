import 'package:formulize/src/core/errors/failures.dart';
import 'package:formulize/src/shared/infra/services/realm/models/generate/realm_models.dart';
import 'package:result_dart/result_dart.dart';

import '../repository/ihome_repository.dart';

abstract class IGetForms {
  Future<Result<List<Forms>, IFailure>> call(StatusForms? status);
}

class GetForms implements IGetForms {
  final IHomeRepository repository;
  const GetForms(this.repository);

  @override
  Future<Result<List<Forms>, IFailure>> call(StatusForms? status) async {
    try {
      final formsResult = await repository.getForms(status);
      return formsResult.toSuccess();
    } on IFailure catch (error) {
      return error.toFailure();
    }
  }
}
