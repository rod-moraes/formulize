import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:realm/realm.dart';

import '../../../../shared/infra/services/realm/models/generate/realm_models.dart';
import '../atoms/edit_form_atomic.dart';

class AnswerFormPage extends StatefulWidget {
  final Forms forms;
  const AnswerFormPage({
    Key? key,
    required this.forms,
  }) : super(key: key);

  @override
  State<AnswerFormPage> createState() => _AnswerFormPageState();
}

class _AnswerFormPageState extends State<AnswerFormPage> {
  final formAtomic = Modular.get<EditFormAtomic>();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _formKey.currentState?.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    formAtomic.questions.value = widget.forms.questions;
    formAtomic.title.value = widget.forms.title;
    formAtomic.id.value = widget.forms.id;
    formAtomic.answer.value = widget.forms.answers;
    if (widget.forms.status != null) {
      formAtomic.status.value = StatusForms.fromStatus(widget.forms.status!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.forms.title),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          if (_formKey.currentState?.validate() ?? false) {
            formAtomic.saveNewAnswerData();
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
                    labelText: 'E-mail',
                    hintText: 'Digite o seu e-mail',
                  ),
                  initialValue: formAtomic.answerEdit.value.email,
                  onChanged: (value) =>
                      formAtomic.answerEdit.value.email = value,
                ),
                const SizedBox(height: 8),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Nome',
                    hintText: 'Digite o seu nome',
                  ),
                  initialValue: formAtomic.answerEdit.value.name,
                  onChanged: (value) =>
                      formAtomic.answerEdit.value.name = value,
                ),
                const SizedBox(height: 8),
                ...widget.forms.questions.map((question) {
                  final type = TypeQuestionForms.fromQuestion(question.type);
                  if (type == null) return Container();
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: type.widget(
                      data: question,
                      focusNode: FocusNode(),
                      onCallbackNoValid: () {},
                      onChanged: (value) {
                        final answerEdition = formAtomic.answerEdit.value;
                        answerEdition.answers.removeWhere(
                          (element) => element.question == question,
                        );
                        answerEdition.answers.add(
                          Answer(
                            Uuid.v4(),
                            value,
                            question: question,
                          ),
                        );
                        print(formAtomic.answerEdit.value);
                      },
                      onFieldSubmitted: (value) {},
                    ),
                  );
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
