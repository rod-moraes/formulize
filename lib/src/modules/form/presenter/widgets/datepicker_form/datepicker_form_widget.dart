import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../dropdown_button_custom/dropdown_button_adapter.dart';

class DatePickerFormWidget extends StatefulWidget {
  final DateTime initialDate;
  final DateTime firstDate;
  final DateTime lastDate;
  final String label;
  final void Function(DateTime? date) onChanged;
  final void Function()? onDeleted;
  final DateTime? initialValue;
  final DateFormat? format;
  final bool isRequired;
  final bool disable;
  final FocusNode? focusNode;
  final void Function()? onCallbackNoValid;
  const DatePickerFormWidget({
    Key? key,
    required this.initialDate,
    required this.firstDate,
    required this.lastDate,
    required this.label,
    required this.onChanged,
    this.onDeleted,
    this.initialValue,
    this.format,
    this.isRequired = false,
    this.disable = false,
    this.focusNode,
    this.onCallbackNoValid,
  }) : super(key: key);

  @override
  State<DatePickerFormWidget> createState() => _DatePickerFormWidgetState();
}

class _DatePickerFormWidgetState extends State<DatePickerFormWidget> {
  late ValueNotifier<DateTime?> initialValue =
      ValueNotifier(widget.initialValue);
  String _getTextDatePickerForm(DateTime? date, DateFormat? format) =>
      date != null
          ? (format ?? DateFormat('dd/MM/yyyy')).format(date)
          : 'Selecione';

  Future<void> openDatePicker(DateTime? newValue, FormState? formKey) async {
    final dateSelect = await showDatePicker(
      context: context,
      initialDate: newValue ?? widget.initialDate,
      lastDate: widget.lastDate,
      firstDate: widget.firstDate,
    );
    if (dateSelect != null) {
      initialValue.value = dateSelect;
      formKey?.validate();
      widget.onChanged(dateSelect);
    }
  }

  void onDeletedDate(DateTime? newValue) {
    initialValue.value = null;
    widget.onDeleted!();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: initialValue,
      builder: (context, newValue, __) {
        return Stack(
          alignment: AlignmentDirectional.centerStart,
          children: [
            InkWell(
              focusNode: widget.focusNode,
              onTap: widget.disable
                  ? null
                  : () => openDatePicker(
                        newValue,
                        context.findAncestorStateOfType<FormState>(),
                      ),
              child: DropdownButtonCustom<DateTime>(
                key: ValueKey(newValue),
                icon: const SizedBox.shrink(),
                labelText: widget.label,
                listOfItems: newValue != null ? [newValue] : [],
                initialValue: newValue,
                enableEmpty: true,
                isRequired: widget.isRequired,
                getTextLabel: (date) =>
                    _getTextDatePickerForm(date, widget.format),
                disable: widget.disable,
                onCallbackNoValid: widget.onCallbackNoValid,
              ),
            ),
            if (widget.onDeleted != null && initialValue.value != null)
              Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                  padding: EdgeInsets.zero,
                  splashRadius: 24,
                  onPressed:
                      widget.disable ? null : () => onDeletedDate(newValue),
                  icon: const Icon(Icons.close),
                ),
              ),
          ],
        );
      },
    );
  }
}
