import 'package:flutter/material.dart';

abstract class DropdownButtonWidget<T> extends StatelessWidget {
  final Color? focusColor;
  final FocusNode? focusNode;
  final Color? colorIcon;
  final Color? colorText;
  final List<T> listOfItems;
  final String labelText;
  final String? hint;
  final bool isRequired;
  final T? initialValue;
  final void Function(T?)? onChanged;
  final InputDecoration? decoration;
  final EdgeInsets? contentPadding;
  final String Function(T?)? getTextLabel;
  final bool enableEmpty;
  final String? Function(T?)? validator;
  final Widget? icon;
  final AutovalidateMode? autovalidateMode;
  final bool disable;

  final void Function()? onCallbackNoValid;

  const DropdownButtonWidget({
    Key? key,
    required this.focusColor,
    this.focusNode,
    this.colorIcon,
    this.colorText,
    required this.listOfItems,
    required this.labelText,
    this.hint,
    this.isRequired = false,
    this.initialValue,
    this.onChanged,
    this.decoration,
    this.contentPadding,
    this.getTextLabel,
    this.enableEmpty = false,
    this.validator,
    this.icon,
    this.autovalidateMode,
    this.disable = false,
    this.onCallbackNoValid,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: Theme(
        data: theme.copyWith(
          colorScheme: theme.colorScheme.copyWith(
            primary: focusColor,
          ),
        ),
        child: DropdownButtonFormField<T>(
          focusNode: focusNode,
          autovalidateMode: autovalidateMode,
          decoration: (decoration ??
                  InputDecoration(
                    contentPadding: const EdgeInsets.only(left: 4, top: 4),
                    labelText: isRequired ? '$labelText *' : labelText,
                    focusColor: focusColor,
                  ))
              .copyWith(contentPadding: contentPadding),
          value: initialValue,
          isExpanded: true,
          validator: _validatorForm,
          style: TextStyle(color: colorText),
          icon: icon ??
              Icon(
                Icons.arrow_drop_down_outlined,
                color: colorIcon,
              ),
          hint: Text(hint ?? ''),
          onChanged: disable ? null : onChanged,
          items: itens(context),
        ),
      ),
    );
  }

  void _isValid(bool value) {
    if (onCallbackNoValid != null && !value) {
      onCallbackNoValid!();
    }
  }

  String? _validatorForm(T? value) {
    if (isRequired && value == null) {
      _isValid(false);
      return 'Campo obrigatório';
    }
    if (validator != null) {
      final valid = validator!(value);
      _isValid(valid == null);
      return valid;
    }

    _isValid(true);
    return null;
  }

  List<DropdownMenuItem<T>> itens(BuildContext context) {
    final theme = Theme.of(context);

    final itens = listOfItems.map<DropdownMenuItem<T>>((T value) {
      return DropdownMenuItem<T>(
        value: value,
        child: Text(
          getTextLabel != null ? getTextLabel!(value) : value.toString(),
        ),
      );
    }).toList();

    if (enableEmpty) {
      itens.insert(
        0,
        DropdownMenuItem<T>(
          child: const Text(
            'Selecione',
          ),
        ),
      );
    }

    return itens;
  }
}
