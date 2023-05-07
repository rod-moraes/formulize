import 'package:asuka/asuka.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../shared/infra/services/realm/models/generate/realm_models.dart';
import '../hourpicker_form/hourpicker_form_widget.dart';

class FieldTimeCustom extends StatelessWidget {
  final Question data;
  final void Function(String) onChanged;
  final FocusNode focusNode;
  final void Function(String)? onFieldSubmitted;
  final void Function()? onCallbackNoValid;
  final String? initialValue;
  const FieldTimeCustom({
    required this.data,
    required this.onChanged,
    required this.focusNode,
    this.onFieldSubmitted,
    this.onCallbackNoValid,
    this.initialValue,
    Key? key,
  }) : super(key: key);

  TimeOfDay? _getTimePickerTextForm(String? date) {
    try {
      if (date != null && date.isNotEmpty) {
        final format = DateFormat('hh:mm');
        return TimeOfDay.fromDateTime(format.parse(date));
      }
    } catch (e) {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        Asuka.removeCurrentSnackBar();
        AsukaSnackbar.alert('Erro na conversão de data').show();
      });
      return null;
    }
    return null;
  }

  String _getTextTimePickerForm(TimeOfDay? time, BuildContext context) =>
      time != null ? time.format(context) : '';
  @override
  Widget build(BuildContext context) {
    return TimePickerFormWidget(
      initialValue: _getTimePickerTextForm(initialValue),
      label: data.hint,
      isRequired: true,
      onChanged: (date) => onChanged(_getTextTimePickerForm(date, context)),
      onDeleted: () => onChanged(''),
    );
  }
}
