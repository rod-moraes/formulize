import 'package:flutter/material.dart';

import '../dropdown_button_custom/dropdown_button_adapter.dart';

class TimePickerFormWidget extends StatefulWidget {
  final String label;
  final void Function(TimeOfDay? date) onChanged;
  final void Function()? onDeleted;
  final TimeOfDay? initialValue;
  final bool isRequired;
  final bool disable;
  final FocusNode? focusNode;
  final void Function()? onCallbackNoValid;
  const TimePickerFormWidget({
    Key? key,
    required this.label,
    required this.onChanged,
    this.onDeleted,
    this.initialValue,
    this.isRequired = false,
    this.disable = false,
    this.focusNode,
    this.onCallbackNoValid,
  }) : super(key: key);

  @override
  State<TimePickerFormWidget> createState() => _TimePickerFormWidgetState();
}

class _TimePickerFormWidgetState extends State<TimePickerFormWidget> {
  late ValueNotifier<TimeOfDay?> initialValue =
      ValueNotifier(widget.initialValue);
  String _getTextTimePickerForm(TimeOfDay? time) =>
      time != null ? time.format(context) : 'Selecione';

  Future<void> openTimePicker(TimeOfDay? newValue, FormState? formKey) async {
    final dateSelect = await showTimePicker(
      context: context,
      initialTime: newValue ?? TimeOfDay.now(),
    );

    if (dateSelect != null) {
      initialValue.value = dateSelect;
      formKey?.validate();
      widget.onChanged(dateSelect);
    }
  }

  void onDeletedDate(TimeOfDay? newValue) {
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
                  : () => openTimePicker(
                        newValue,
                        context.findAncestorStateOfType<FormState>(),
                      ),
              child: DropdownButtonCustom<TimeOfDay>(
                key: ValueKey(newValue),
                icon: const SizedBox.shrink(),
                labelText: widget.label,
                listOfItems: newValue != null ? [newValue] : [],
                initialValue: newValue,
                enableEmpty: true,
                isRequired: widget.isRequired,
                getTextLabel: _getTextTimePickerForm,
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
