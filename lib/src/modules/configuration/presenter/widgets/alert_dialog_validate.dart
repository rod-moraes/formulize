import 'package:flutter/material.dart';

class AlertDialogValidate extends StatefulWidget {
  const AlertDialogValidate({super.key});

  @override
  State<AlertDialogValidate> createState() => _AlertDialogValidateState();
}

class _AlertDialogValidateState extends State<AlertDialogValidate> {
  final _textEditingController = TextEditingController();
  final _passwordVisible = ValueNotifier<bool>(true);

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _textEditingController.dispose();
    _formKey.currentState?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: ValueListenableBuilder(
        valueListenable: _passwordVisible,
        builder: (context, value, _) {
          return Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: _textEditingController,
                  validator: (value) {
                    if (value != null && value.isNotEmpty) {
                      return null;
                    }
                    return 'Campo obrigatório';
                  },
                  obscureText: value,
                  decoration: InputDecoration(
                    labelText: 'Senha: ',
                    hintText: 'Digite sua senha.',
                    suffixIcon: ExcludeFocus(
                      excluding: false,
                      child: Padding(
                        padding: const EdgeInsetsDirectional.only(end: 8),
                        child: Material(
                          color: Colors.transparent,
                          child: IconButton(
                            splashRadius: 24,
                            onPressed: () {
                              _passwordVisible.value = !_passwordVisible.value;
                            },
                            icon: Icon(
                              _passwordVisible.value
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility_outlined,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
      title: const Text('Desbloquear super usuário'),
      actions: <Widget>[
        InkWell(
          child: const Text('OK'),
          onTap: () {
            if (_formKey.currentState?.validate() ?? false) {
              Navigator.of(context).pop(_textEditingController.text);
            }
          },
        ),
      ],
    );
  }
}
