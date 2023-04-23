import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class DrawerGlobal extends StatelessWidget {
  const DrawerGlobal({super.key});

  @override
  Widget build(BuildContext context) {
    // final appStore = context.watch<AppStore>((store) => store.syncDate);
    // final syncDate = appStore.syncDate.value;
    // var syncDateText = 'Nunca';
    // if (syncDate != null) {
    //   final format = DateFormat('dd/MM/yyyy ás hh:mm');
    //   syncDateText = format.format(syncDate);
    // }
    return NavigationDrawer(
      onDestinationSelected: (index) {
        if (index == 1) {
          Modular.to.pop();
          Modular.to.pushNamed('/config/');
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
                  'Nunca',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ),
        ),
        const NavigationDrawerDestination(
          icon: Icon(Icons.settings),
          label: Text('Configurações'),
        ),
      ],
    );
  }
}
