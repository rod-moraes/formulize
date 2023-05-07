import 'package:asuka/asuka.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:formulize/src/modules/form/domain/usecases/save_form.dart';
import 'package:formulize/src/modules/form/presenter/atoms/edit_form_atomic.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:rx_notifier/rx_notifier.dart';

class EditFormReducer extends RxReducer {
  final EditFormAtomic _atomic;
  final ISaveForm _saveForm;

  EditFormReducer(
    this._atomic,
    this._saveForm,
  ) {
    //actions
    on(() => [_atomic.saveData.value], _saveData);
    //actions
    on(() => [_atomic.saveNewAnswerData.value], _saveNewAnswerData);
  }

  Future<void> _saveNewAnswerData() async {
    globalLoaderContext.loaderOverlay.show();
    final forms = _atomic.forms..answers.add(_atomic.answerEdit.value);
    final resultForm = await _saveForm(forms);
    resultForm.fold(
      (success) {
        Asuka.removeCurrentSnackBar();
        AsukaSnackbar.success('Sucesso ao salvar a resposta!').show();
        Modular.to.pop(success);
      },
      (failure) {
        Asuka.removeCurrentSnackBar();
        AsukaSnackbar.alert(failure.message).show();
      },
    );
    globalLoaderContext.loaderOverlay.hide();
  }

  Future<void> _saveData() async {
    globalLoaderContext.loaderOverlay.show();
    final forms = _atomic.forms;
    final resultForm = await _saveForm(forms);
    resultForm.fold(
      (success) {
        Asuka.removeCurrentSnackBar();
        AsukaSnackbar.success('Sucesso ao salvar o formulario!').show();
        Modular.to.pop(success);
      },
      (failure) {
        Asuka.removeCurrentSnackBar();
        AsukaSnackbar.alert(failure.message).show();
      },
    );
    globalLoaderContext.loaderOverlay.hide();
  }
}
