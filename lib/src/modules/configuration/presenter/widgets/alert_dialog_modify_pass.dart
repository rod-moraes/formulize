import 'package:flutter/material.dart';

class AlertDialogModifyPass extends StatefulWidget {
  const AlertDialogModifyPass({super.key});

  @override
  State<AlertDialogModifyPass> createState() => _AlertDialogModifyPassState();
}

class _AlertDialogModifyPassState extends State<AlertDialogModifyPass> {
  final _textEditingControllerOldPass = TextEditingController();
  final _textEditingControllerNewPass = TextEditingController();
  final _textEditingControllerNewPassConfirm = TextEditingController();
  final _passwordVisibleOldPass = ValueNotifier<bool>(true);
  final _passwordVisibleNewPass = ValueNotifier<bool>(true);
  final _passwordVisibleNewPassConfirm = ValueNotifier<bool>(true);

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _textEditingControllerOldPass.dispose();
    _textEditingControllerNewPass.dispose();
    _formKey.currentState?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ValueListenableBuilder(
              valueListenable: _passwordVisibleOldPass,
              builder: (context, value, _) {
                return TextFormField(
                  controller: _textEditingControllerOldPass,
                  validator: (value) {
                    if (value != null && value.isNotEmpty) {
                      return null;
                    }
                    return 'Campo obrigatório';
                  },
                  obscureText: value,
                  decoration: InputDecoration(
                    labelText: 'Senha atual: ',
                    hintText: 'Digite sua senha atual.',
                    suffixIcon: ExcludeFocus(
                      excluding: false,
                      child: Padding(
                        padding: const EdgeInsetsDirectional.only(end: 8),
                        child: Material(
                          color: Colors.transparent,
                          child: IconButton(
                            splashRadius: 24,
                            onPressed: () {
                              _passwordVisibleOldPass.value =
                                  !_passwordVisibleOldPass.value;
                            },
                            icon: Icon(
                              _passwordVisibleOldPass.value
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility_outlined,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 8),
            ValueListenableBuilder(
              valueListenable: _passwordVisibleNewPass,
              builder: (context, value, _) {
                return TextFormField(
                  controller: _textEditingControllerNewPass,
                  validator: (value) {
                    if (_textEditingControllerNewPassConfirm.text.isEmpty) {
                      return 'Campo obrigatório';
                    }
                    if (_textEditingControllerNewPassConfirm.text !=
                        _textEditingControllerNewPass.text) {
                      return 'Senhas não correspondem';
                    }
                    return null;
                  },
                  obscureText: value,
                  decoration: InputDecoration(
                    labelText: 'Nova senha: ',
                    hintText: 'Digite sua nova senha.',
                    suffixIcon: ExcludeFocus(
                      excluding: false,
                      child: Padding(
                        padding: const EdgeInsetsDirectional.only(end: 8),
                        child: Material(
                          color: Colors.transparent,
                          child: IconButton(
                            splashRadius: 24,
                            onPressed: () {
                              _passwordVisibleNewPass.value =
                                  !_passwordVisibleNewPass.value;
                            },
                            icon: Icon(
                              _passwordVisibleNewPass.value
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility_outlined,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 8),
            ValueListenableBuilder(
              valueListenable: _passwordVisibleNewPassConfirm,
              builder: (context, value, _) {
                return TextFormField(
                  controller: _textEditingControllerNewPassConfirm,
                  validator: (value) {
                    if (_textEditingControllerNewPassConfirm.text.isEmpty) {
                      return 'Campo obrigatório';
                    }
                    if (_textEditingControllerNewPassConfirm.text !=
                        _textEditingControllerNewPass.text) {
                      return 'Senhas não correspondem';
                    }
                    return null;
                  },
                  obscureText: value,
                  decoration: InputDecoration(
                    labelText: 'Confirmar nova senha: ',
                    hintText: 'Digite novamente sua nova senha.',
                    suffixIcon: ExcludeFocus(
                      excluding: false,
                      child: Padding(
                        padding: const EdgeInsetsDirectional.only(end: 8),
                        child: Material(
                          color: Colors.transparent,
                          child: IconButton(
                            splashRadius: 24,
                            onPressed: () {
                              _passwordVisibleNewPassConfirm.value =
                                  !_passwordVisibleNewPassConfirm.value;
                            },
                            icon: Icon(
                              _passwordVisibleNewPassConfirm.value
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility_outlined,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      title: const Text('Alteração de senha'),
      actions: <Widget>[
        InkWell(
          child: const Text('OK'),
          onTap: () {
            if (_formKey.currentState?.validate() ?? false) {
              Navigator.of(context).pop([
                _textEditingControllerNewPass.text,
                _textEditingControllerOldPass.text,
              ]);
            }
          },
        ),
      ],
    );
  }
}
