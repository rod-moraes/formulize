import 'package:asuka/asuka.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:formulize/src/modules/configuration/presenter/widgets/alert_dialog_validate.dart';
import 'package:formulize/src/shared/presenter/atoms/app_atomic.dart';
import 'package:rx_notifier/rx_notifier.dart';

import '../widgets/alert_dialog_modify_pass.dart';

class ConfigurationPage extends StatefulWidget {
  const ConfigurationPage({super.key});

  @override
  State<ConfigurationPage> createState() => _ConfigurationPageState();
}

class _ConfigurationPageState extends State<ConfigurationPage> {
  final appAtomic = Modular.get<AppAtomic>();

  void _onChangedTheme(ThemeMode? theme) {
    if (theme != null) {
      appAtomic.themeMode.value = theme;
      appAtomic.saveThemeMode();
    }
  }

  Future<void> _onValidatePassword() async {
    final password = await Asuka.showDialog(
      barrierColor: Colors.black38,
      builder: (context) => const AlertDialogValidate(),
    );
    if (password is String) {
      appAtomic.superUserPass.value = password;
      appAtomic.validateSuperUserPass();
    }
  }

  Future<void> _onModifyPassword() async {
    final passwords = await Asuka.showDialog(
      barrierColor: Colors.black38,
      builder: (context) => const AlertDialogModifyPass(),
    );
    if (passwords is List && passwords.length == 2) {
      appAtomic.modifySuperUserPass.value = passwords[0];
      appAtomic.superUserPass.value = passwords[1];
      appAtomic.modifySuperUserPass();
    }
  }

  @override
  void initState() {
    super.initState();
    appAtomic.init();
  }

  @override
  Widget build(BuildContext context) {
    final themeMode = context.select(() => appAtomic.themeMode.value);
    final isValidate = context.select(() => appAtomic.isValidateUser.value);
    return Scaffold(
      appBar: AppBar(
        title: const Text('FORMULIZE'),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Configurações',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 20),
            Text(
              'Tema',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 10),
            RadioListTile(
              value: ThemeMode.system,
              groupValue: themeMode,
              onChanged: _onChangedTheme,
              title: const Text('Sistema'),
            ),
            RadioListTile(
              value: ThemeMode.light,
              groupValue: themeMode,
              onChanged: _onChangedTheme,
              title: const Text('Claro'),
            ),
            RadioListTile(
              value: ThemeMode.dark,
              groupValue: themeMode,
              onChanged: _onChangedTheme,
              title: const Text('Escuro'),
            ),
            const SizedBox(height: 20),
            Text(
              'Super usuário',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 10),
            OutlinedButton(
              onPressed: isValidate
                  ? appAtomic.blockedSuperUser.call
                  : _onValidatePassword,
              child: Text(
                isValidate
                    ? 'Bloquear super usuário'
                    : 'Desbloquear super usuário',
              ),
            ),
            const SizedBox(height: 10),
            OutlinedButton(
              onPressed: isValidate ? _onModifyPassword : null,
              child: Text(
                isValidate
                    ? 'Modificar senha de super usuário'
                    : 'Usuário bloqueado',
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Controle de dados',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 10),
            OutlinedButton(
              onPressed: appAtomic.deleteApp,
              child: const Text('Apagar cache e reiniciar o app'),
            ),
          ],
        ),
      ),
    );
  }
}
