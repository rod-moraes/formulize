import 'package:asuka/asuka.dart';
import 'package:formulize/src/modules/home/domain/usecases/get_forms.dart';
import 'package:formulize/src/modules/home/presenter/atoms/home_atomic.dart';
import 'package:formulize/src/modules/home/presenter/enums/filter_forms_enum.dart';
import 'package:formulize/src/shared/infra/services/realm/models/generate/realm_models.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:rx_notifier/rx_notifier.dart';

import '../../../../shared/presenter/atoms/app_atomic.dart';

class HomeReducer extends RxReducer {
  final HomeAtomic _atomic;
  final AppAtomic _appAtomic;
  final IGetForms _getForms;

  HomeReducer(
    this._atomic,
    this._getForms,
    this._appAtomic,
  ) {
    //actions
    on(() => [_atomic.init.value], _init);
    //atoms
    on(() => [_atomic.filter.value], _init);
    on(() => [_appAtomic.syncDate.value], _init);
  }

  Future<void> _init() async {
    globalLoaderContext.loaderOverlay.show();
    StatusForms? status;
    if (_atomic.filter.value == FilterFormsEnum.ativados) {
      status = StatusForms.active;
    } else if (_atomic.filter.value == FilterFormsEnum.desativados) {
      status = StatusForms.inactive;
    }
    final resultForm = await _getForms(status);
    resultForm.fold(
      (success) {
        _atomic.forms.value = success;
      },
      (failure) {
        Asuka.removeCurrentSnackBar();
        AsukaSnackbar.alert(failure.message).show();
      },
    );
    globalLoaderContext.loaderOverlay.hide();
  }
}
