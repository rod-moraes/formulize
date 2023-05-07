import 'package:asuka/asuka.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../../shared/infra/services/realm/models/generate/realm_models.dart';
import '../datepicker_form/datepicker_form_widget.dart';

class FieldDateCustom extends StatelessWidget {
  final Question data;
  final void Function(String) onChanged;
  final FocusNode focusNode;
  final void Function(String)? onFieldSubmitted;
  final void Function()? onCallbackNoValid;
  final String? initialValue;
  const FieldDateCustom({
    required this.data,
    required this.onChanged,
    required this.focusNode,
    this.onFieldSubmitted,
    this.onCallbackNoValid,
    this.initialValue,
    Key? key,
  }) : super(key: key);

  DateTime? _getDatePickerTextForm(String? date) {
    try {
      if (date != null && date.isNotEmpty) {
        return DateFormat('dd/MM/yyyy').parse(date);
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

  String _getTextDatePickerForm(DateTime? date) =>
      date != null ? DateFormat('dd/MM/yyyy').format(date) : '';

  @override
  Widget build(BuildContext context) {
    return DatePickerFormWidget(
      focusNode: focusNode,
      onCallbackNoValid: onCallbackNoValid,
      firstDate: DateTime(1800),
      lastDate: DateTime(2200),
      initialDate: _getDatePickerTextForm(initialValue) ?? DateTime.now(),
      initialValue: _getDatePickerTextForm(initialValue),
      label: data.hint,
      isRequired: true,
      onChanged: (date) => onChanged(_getTextDatePickerForm(date)),
      onDeleted: () => onChanged(''),
    );
  }
}
