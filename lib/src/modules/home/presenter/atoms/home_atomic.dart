import 'package:rx_notifier/rx_notifier.dart';

import '../../../../shared/infra/services/realm/models/generate/realm_models.dart';
import '../enums/filter_forms_enum.dart';

class HomeAtomic {
  // atoms
  final forms = RxNotifier<List<Forms>>([]);
  final filter = RxNotifier<FilterFormsEnum>(FilterFormsEnum.todos);

  // actions
  final init = RxNotifier(null);
}
