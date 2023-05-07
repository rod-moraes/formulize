import 'package:flutter/material.dart';
import 'package:formulize/src/shared/infra/services/realm/models/generate/realm_models.dart';

class FieldCheckCustom extends StatefulWidget {
  final Question data;
  final void Function(String) onChanged;
  final FocusNode focusNode;
  final void Function(String)? onFieldSubmitted;
  final void Function()? onCallbackNoValid;
  final String? initialValue;
  const FieldCheckCustom({
    required this.data,
    required this.onChanged,
    required this.focusNode,
    this.onFieldSubmitted,
    this.onCallbackNoValid,
    this.initialValue,
    Key? key,
  }) : super(key: key);

  @override
  State<FieldCheckCustom> createState() => _FieldCheckCustomState();
}

class _FieldCheckCustomState extends State<FieldCheckCustom> {
  late final ValueNotifier<bool> switchValue =
      ValueNotifier<bool>(widget.initialValue == '1');
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: switchValue,
      builder: (context, _, __) {
        return CheckboxListTile(
          focusNode: widget.focusNode,
          value: switchValue.value,
          contentPadding: const EdgeInsets.only(top: 4),
          title: Text(
            widget.data.hint,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          onChanged: (value) {
            if (value != null) {
              switchValue.value = value;
              widget.onChanged(switchValue.value ? '1' : '0');
            }
          },
          shape: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xffC9C9CA),
              width: 1.5,
            ),
          ),
        );
      },
    );
  }
}
