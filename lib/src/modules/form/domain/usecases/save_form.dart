import 'package:formulize/src/core/errors/failures.dart';
import 'package:formulize/src/shared/infra/services/realm/models/generate/realm_models.dart';
import 'package:result_dart/result_dart.dart';

import '../repository/iform_repository.dart';

abstract class ISaveForm {
  Future<Result<Forms, IFailure>> call(Forms forms);
}

class SaveForm implements ISaveForm {
  final IFormRepository repository;
  const SaveForm(this.repository);

  @override
  Future<Result<Forms, IFailure>> call(Forms forms) async {
    try {
      final formsResult = await repository.saveForm(forms);
      return formsResult.toSuccess();
    } on IFailure catch (error) {
      return error.toFailure();
    }
  }
}
