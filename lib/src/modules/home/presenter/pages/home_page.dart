
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:formulize/src/shared/presenter/widgets/drawer_global.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final segmentIndex = ValueNotifier({0});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerGlobal(),
      appBar: AppBar(
        title: const Text('FORMULIZE'),
      ),
      body: Center(
        child: Column(
          children: [
            ValueListenableBuilder(
              builder: (context, _, __) {
                return Padding(
                  padding: const EdgeInsets.all(8),
                  child: SegmentedButton<int>(
                    onSelectionChanged: (value) {
                      segmentIndex.value = value;
                    },
                    segments: const [
                      ButtonSegment(value: 0, label: Text('Todos')),
                      ButtonSegment(value: 1, label: Text('Ativados')),
                      ButtonSegment(value: 2, label: Text('Desativados')),
                    ],
                    selected: segmentIndex.value,
                  ),
                );
              },
              valueListenable: segmentIndex,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Modular.to.pushNamed('../form/edit');
        },
        label: const Text('Novo formulário'),
        icon: const Icon(Icons.edit),
      ),
    );
  }
}
