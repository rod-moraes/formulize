import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:formulize/src/modules/form/presenter/widgets/create_question_widget.dart';
import 'package:realm/realm.dart';
import 'package:rx_notifier/rx_notifier.dart';

import '../../../../shared/infra/services/realm/models/generate/realm_models.dart';
import '../atoms/edit_form_atomic.dart';
import '../widgets/card_question_widget.dart';

class EditFormPage extends StatefulWidget {
  final Forms? forms;
  const EditFormPage({
    Key? key,
    this.forms,
  }) : super(key: key);

  @override
  State<EditFormPage> createState() => _EditFormPageState();
}

class _EditFormPageState extends State<EditFormPage> {
  final formAtomic = Modular.get<EditFormAtomic>();
  final _formKey = GlobalKey<FormState>();

  Question _createQuestionEmpty() => Question(
        Uuid.v4(),
        '',
        '',
        type: TypeQuestionForms.text.toTypeQuestion,
      );

  @override
  void dispose() {
    _formKey.currentState?.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    if (widget.forms != null) {
      formAtomic.questions.value = widget.forms!.questions;
      formAtomic.title.value = widget.forms!.title;
      formAtomic.id.value = widget.forms!.id;
      formAtomic.answer.value = widget.forms!.answers;
      if (widget.forms!.status != null) {
        formAtomic.status.value = StatusForms.fromStatus(widget.forms!.status!);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Novo formulário'),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          if (_formKey.currentState?.validate() ?? false) {
            formAtomic.saveData();
          }
        },
        icon: const Icon(Icons.save),
        label: const Text('Salvar'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Titulo',
                    hintText: 'Digite o titulo do formulário',
                  ),
                  initialValue: formAtomic.title.value,
                  onChanged: (value) => formAtomic.title.value = value,
                  validator: (value) =>
                      value?.isEmpty ?? true ? 'Campo obrigatório' : null,
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField<StatusForms>(
                  isExpanded: true,
                  validator: (value) =>
                      value == null ? 'Campo obrigatório' : null,
                  decoration: const InputDecoration(
                    labelText: 'Status',
                    hintText: 'Selecione o status',
                  ),
                  items: StatusForms.values.map((status) {
                    return DropdownMenuItem(
                      value: status,
                      child: Text(status.title),
                    );
                  }).toList(),
                  value: formAtomic.status.value,
                  onChanged: widget.forms == null
                      ? null
                      : (value) => formAtomic.status.value = value!,
                ),
                const SizedBox(height: 16),
                RxBuilder(
                  builder: (context) {
                    final question = formAtomic.question.value;
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ElevatedButton(
                              onPressed: question == null
                                  ? () => formAtomic.question.value =
                                      _createQuestionEmpty()
                                  : null,
                              child: const Text('Nova questão'),
                            )
                          ],
                        ),
                        const SizedBox(height: 16),
                        Visibility(
                          visible: question != null,
                          child: CreateQuestionWidget(
                            question: question ?? _createQuestionEmpty(),
                            onCancel: (question) {
                              formAtomic.question.value = null;
                              if (question != null) {
                                formAtomic.questions.value = [
                                  question,
                                  ...formAtomic.questions.value,
                                ];
                              }
                            },
                            onSaved: (question) {
                              formAtomic.questions.value = [
                                question,
                                ...formAtomic.questions.value,
                              ];
                              formAtomic.question.value = null;
                            },
                          ),
                        ),
                        RxBuilder(
                          builder: (context) {
                            final questions = formAtomic.questions.value;
                            return Column(
                              mainAxisSize: MainAxisSize.min,
                              children: questions
                                  .asMap()
                                  .entries
                                  .map(
                                    (quest) => Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 8,
                                      ),
                                      child: CardQuestionWidget(
                                        question: quest.value,
                                        index: quest.key,
                                        onTapEdit: () {
                                          if (question == null) {
                                            formAtomic.question.value =
                                                quest.value;
                                            formAtomic.questions.value =
                                                formAtomic.questions.value
                                                    .where(
                                                      (element) =>
                                                          element.id !=
                                                          quest.value.id,
                                                    )
                                                    .toList();
                                          }
                                        },
                                        onTapDelete: () {
                                          formAtomic.questions.value =
                                              formAtomic.questions.value
                                                  .where(
                                                    (element) =>
                                                        element.id !=
                                                        quest.value.id,
                                                  )
                                                  .toList();
                                          // formAtomic.questions.value = [
                                          //   ...questions
                                          // ];
                                        },
                                      ),
                                    ),
                                  )
                                  .toList(),
                            );
                          },
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
