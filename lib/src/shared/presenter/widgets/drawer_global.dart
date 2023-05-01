import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:formulize/src/shared/presenter/atoms/app_atomic.dart';
import 'package:rx_notifier/rx_notifier.dart';

class DrawerGlobal extends StatelessWidget {
  const DrawerGlobal({super.key});

  @override
  Widget build(BuildContext context) {
    final appAtomic = Modular.get<AppAtomic>();
    final syncDateText = context.select(() => appAtomic.syncDateText);
    return NavigationDrawer(
      onDestinationSelected: (index) async {
        if (index == 0) {
          appAtomic.syncData();
        }
        if (index == 1) {
          Modular.to.pop();
          await Modular.to.pushNamed('/config/');
        }
      },
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 28, 16, 16),
          child: Text(
            'Opções',
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
        NavigationDrawerDestination(
          icon: const Icon(Icons.sync),
          label: SizedBox(
            width: 210,
            child: Row(
              children: [
                const Text('Sincronizar'),
                const Spacer(),
                Text(
                  syncDateText,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
        const NavigationDrawerDestination(
          icon: Icon(Icons.settings),
          label: Text('Configurações'),
        ),
      ],
    );
  }
}
