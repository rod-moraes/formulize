import 'package:flutter/material.dart';
import 'package:formulize/src/shared/infra/services/realm/models/generate/realm_models.dart';

import '../text_form_field_custom/text_form_field_custom_adapter.dart';

class FieldTextCustom extends StatefulWidget {
  final Question data;
  final void Function(String) onChanged;
  final String? initialValue;
  final FocusNode focusNode;
  final void Function(String)? onFieldSubmitted;
  final void Function()? onCallbackNoValid;
  const FieldTextCustom({
    required this.data,
    required this.onChanged,
    required this.focusNode,
    this.initialValue,
    this.onFieldSubmitted,
    this.onCallbackNoValid,
    Key? key,
  }) : super(key: key);

  @override
  State<FieldTextCustom> createState() => _FieldTextCustomState();
}

class _FieldTextCustomState extends State<FieldTextCustom> {
  @override
  void initState() {
    super.initState();
    widget.focusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.data.label,
          style: widget.focusNode.hasFocus
              ? TextStyle(color: theme.colorScheme.primary)
              : null,
        ),
        TextFormFieldCustom(
          focusNode: widget.focusNode,
          onFieldSubmitted: widget.onFieldSubmitted,
          onCallbackNoValid: widget.onCallbackNoValid,
          hintText: widget.data.hint,
          isRequired: true,
          text: widget.initialValue,
          onChanged: widget.onChanged,
        ),
      ],
    );
  }
}
