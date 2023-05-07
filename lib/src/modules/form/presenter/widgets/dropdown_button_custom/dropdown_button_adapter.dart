import 'package:flutter/material.dart';

import 'dropdown_button_widget.dart';

class DropdownButtonCustom<T> extends DropdownButtonWidget<T> {
  const DropdownButtonCustom({
    super.key,
    super.isRequired,
    super.initialValue,
    super.autovalidateMode,
    super.colorIcon,
    super.colorText,
    super.contentPadding,
    super.focusColor,
    super.getTextLabel,
    super.enableEmpty,
    required super.labelText,
    required super.listOfItems,
    super.onChanged,
    super.validator,
    super.icon,
    super.disable,
    super.onCallbackNoValid,
    super.focusNode,
  }) : super(
          hint: 'Selecione',
        );

  const DropdownButtonCustom.appBar({
    super.key,
    super.isRequired,
    super.initialValue,
    super.colorIcon,
    super.colorText,
    super.contentPadding,
    super.focusColor,
    super.enableEmpty,
    super.validator,
    super.focusNode,
    super.onCallbackNoValid,
    super.decoration = const InputDecoration(
      border: InputBorder.none,
      errorBorder: InputBorder.none,
      enabledBorder: InputBorder.none,
      focusedBorder: InputBorder.none,
      disabledBorder: InputBorder.none,
      focusedErrorBorder: InputBorder.none,
    ),
    required super.labelText,
    required super.listOfItems,
    super.onChanged,
    super.getTextLabel,
    super.icon,
  }) : super(
          hint: 'Selecione',
        );
}
