import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:formulize/src/shared/infra/services/realm/models/generate/realm_models.dart';
import 'package:formulize/src/shared/presenter/widgets/drawer_global.dart';
import 'package:rx_notifier/rx_notifier.dart';

import '../../../../shared/presenter/atoms/app_atomic.dart';
import '../atoms/home_atomic.dart';
import '../enums/filter_forms_enum.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final atomic = Modular.get<HomeAtomic>();
  final appAtomic = Modular.get<AppAtomic>();

  @override
  void initState() {
    super.initState();
    atomic.init();
  }

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
            RxBuilder(
              builder: (context) {
                final filter = atomic.filter.value;
                return Padding(
                  padding: const EdgeInsets.all(8),
                  child: SegmentedButton<FilterFormsEnum>(
                    onSelectionChanged: (value) {
                      atomic.filter.value = value.first;
                    },
                    segments: FilterFormsEnum.values
                        .map(
                          (mapFilter) => ButtonSegment(
                            value: mapFilter,
                            label: Text(mapFilter.label),
                          ),
                        )
                        .toList(),
                    selected: {filter},
                  ),
                );
              },
            ),
            RxBuilder(
              builder: (context) {
                final forms = atomic.forms.value;
                final isSuperUser = appAtomic.isValidateUser.value;
                return Expanded(
                  child: ListView.builder(
                    itemCount: forms.length,
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    itemBuilder: (context, index) {
                      final form = forms[index];
                      return Card(
                        child: ListTile(
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(16)),
                          ),
                          onTap: () async {
                            if (form.status?.id == StatusForms.active.id) {
                              await Modular.to.pushNamed(
                                '../form/new-answer',
                                arguments: form,
                              );
                              atomic.init();
                            }
                          },
                          title: Text(
                            form.title,
                          ),
                          leading: Icon(
                            form.status?.id == StatusForms.active.toStatus.id
                                ? Icons.check
                                : Icons.close,
                            size: 32,
                          ),
                          trailing: isSuperUser
                              ? Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    IconButton(
                                      onPressed: () async {
                                        await Modular.to.pushNamed(
                                          '../form/view-answers',
                                          arguments: form,
                                        );
                                        atomic.init();
                                      },
                                      icon: const Icon(Icons.read_more),
                                    ),
                                    IconButton(
                                      onPressed: () async {
                                        await Modular.to.pushNamed(
                                          '../form/edit',
                                          arguments: form,
                                        );
                                        atomic.init();
                                      },
                                      icon: const Icon(Icons.edit),
                                    ),
                                  ],
                                )
                              : null,
                          subtitle: Text(
                            'Questões: ${form.questions.length} - '
                            'Respostas ${form.answers.length}',
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: RxBuilder(
        builder: (context) {
          final isSuperUser = appAtomic.isValidateUser.value;
          if (!isSuperUser) return const SizedBox.shrink();
          return FloatingActionButton.extended(
            onPressed: () async {
              await Modular.to.pushNamed('../form/edit');
              atomic.init();
            },
            label: const Text('Novo formulário'),
            icon: const Icon(Icons.edit),
          );
        },
      ),
    );
  }
}
