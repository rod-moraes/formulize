import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../../shared/infra/services/realm/models/generate/realm_models.dart';
import '../text_form_field_custom/text_form_field_custom_adapter.dart';

class FieldNumberCustom extends StatelessWidget {
  final Question data;
  final void Function(String) onChanged;
  final String? initialValue;
  final FocusNode focusNode;
  final void Function(String)? onFieldSubmitted;
  final void Function()? onCallbackNoValid;
  const FieldNumberCustom({
    required this.data,
    required this.onChanged,
    required this.focusNode,
    this.initialValue,
    this.onFieldSubmitted,
    this.onCallbackNoValid,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormFieldCustom(
      focusNode: focusNode,
      onFieldSubmitted: onFieldSubmitted,
      onCallbackNoValid: onCallbackNoValid,
      hintText: data.hint,
      label: data.label,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      isRequired: true,
      text: initialValue,
      onChanged: onChanged,
    );
  }
}
