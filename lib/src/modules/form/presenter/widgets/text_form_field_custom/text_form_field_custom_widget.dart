import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

abstract class TextFormFieldCustomWidget extends StatefulWidget {
  final String? label;
  final String? hintText;
  final bool enabled;
  final bool obscure;
  final bool useBorderTheme;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;

  final void Function()? onCallbackNoValid;
  final void Function(String)? onChanged;
  final TextEditingController? controller;
  final bool isRequired;
  final Color? focusColor;
  final String? text;
  final void Function(String)? onFieldSubmitted;
  final EdgeInsets? contentPadding;
  final bool? isDense;
  final FocusNode? focusNode;
  final bool autofocus;
  final AutovalidateMode? autovalidateMode;

  const TextFormFieldCustomWidget({
    Key? key,
    this.label,
    this.hintText,
    this.enabled = true,
    this.obscure = false,
    this.useBorderTheme = false,
    this.inputFormatters,
    this.validator,
    this.onCallbackNoValid,
    this.onChanged,
    this.controller,
    this.isRequired = false,
    this.focusColor,
    this.text,
    this.onFieldSubmitted,
    this.contentPadding,
    this.isDense,
    this.focusNode,
    this.autofocus = false,
    this.autovalidateMode,
  }) : super(key: key);

  @override
  State<TextFormFieldCustomWidget> createState() =>
      _TextFormFieldCustomWidgetState();
}

class _TextFormFieldCustomWidgetState extends State<TextFormFieldCustomWidget> {
  late bool _obscure;
  @override
  void initState() {
    _obscure = widget.obscure;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Theme(
      data: theme.copyWith(
        colorScheme: theme.colorScheme.copyWith(
          primary: widget.focusColor,
        ),
      ),
      child: TextFormField(
        autovalidateMode: widget.autovalidateMode,
        enabled: widget.enabled,
        focusNode: widget.focusNode,
        controller: widget.controller,
        autofocus: widget.autofocus,
        validator: _validatorForm,
        onFieldSubmitted: widget.onFieldSubmitted,
        obscureText: _obscure,
        enableSuggestions: !widget.obscure,
        autocorrect: !widget.obscure,
        inputFormatters: widget.inputFormatters,
        cursorColor: widget.focusColor,
        initialValue: widget.text,
        onChanged: widget.onChanged,
        decoration: InputDecoration(
          labelText: widget.isRequired && widget.label != null
              ? '${widget.label} *'
              : widget.label,
          focusColor: widget.focusColor,
          hintText: widget.hintText,
          isDense: widget.isDense,
          contentPadding: widget.contentPadding,
          focusedBorder: widget.useBorderTheme
              ? null
              : UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: widget.focusColor ?? theme.colorScheme.onBackground,
                  ),
                ),
          suffixIcon: widget.obscure
              ? Material(
                  color: Colors.transparent,
                  child: IconButton(
                    splashRadius: 24,
                    onPressed: () {
                      _obscure = !_obscure;
                      setState(() {});
                    },
                    icon: Icon(
                      _obscure ? Icons.visibility_off : Icons.visibility,
                    ),
                  ),
                )
              : null,
        ),
      ),
    );
  }

  void _isValid(bool value) {
    if (widget.onCallbackNoValid != null && !value) {
      widget.onCallbackNoValid!();
    }
  }

  String? _validatorForm(String? value) {
    if (widget.isRequired && (value == null || value.isEmpty)) {
      _isValid(false);
      return 'Campo obrigatório.';
    }
    if (widget.validator != null) {
      final validator = widget.validator!(value);
      _isValid(validator == null);
      return validator;
    }
    _isValid(true);
    return null;
  }
}
