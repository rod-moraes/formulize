import 'package:flutter/material.dart';

import '../../../../shared/infra/services/realm/models/generate/realm_models.dart';

class CreateQuestionWidget extends StatefulWidget {
  final Question question;
  final void Function(Question) onSaved;
  final void Function(Question?) onCancel;
  const CreateQuestionWidget({
    Key? key,
    required this.question,
    required this.onSaved,
    required this.onCancel,
  }) : super(key: key);

  @override
  State<CreateQuestionWidget> createState() => _CreateQuestionWidgetState();
}

class _CreateQuestionWidgetState extends State<CreateQuestionWidget> {
  final _formKey = GlobalKey<FormState>();
  late Question question = widget.question;
  late String label = question.label;
  late String hint = question.hint;
  late TypeQuestionForms typeQuestion =
      TypeQuestionForms.fromQuestion(question.type) ?? TypeQuestionForms.text;

  bool get _isNew =>
      widget.question.label.isEmpty && widget.question.hint.isEmpty;

  @override
  void dispose() {
    _formKey.currentState?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormField(
            initialValue: label,
            decoration: const InputDecoration(
              labelText: 'Label da questão',
              hintText: 'Digite o label da questão',
            ),
            validator: (value) =>
                (value?.isEmpty ?? true) ? 'Campo obrigatório' : null,
            onChanged: (value) => label = value,
          ),
          TextFormField(
            initialValue: hint,
            decoration: const InputDecoration(
              labelText: 'Hint da questão',
              hintText: 'Digite o hint da questão',
            ),
            validator: (value) =>
                (value?.isEmpty ?? true) ? 'Campo obrigatório' : null,
            onChanged: (value) => hint = value,
          ),
          DropdownButtonFormField(
            isExpanded: true,
            value: typeQuestion,
            decoration: const InputDecoration(
              labelText: 'Tipo de questão',
              hintText: 'Selecione o tipo de questão',
            ),
            validator: (value) => value == null ? 'Campo obrigatório' : null,
            items: TypeQuestionForms.values.map((typeQuestion) {
              return DropdownMenuItem(
                value: typeQuestion,
                child: Text(
                  typeQuestion.name[0].toUpperCase() +
                      typeQuestion.name.substring(1),
                ),
              );
            }).toList(),
            onChanged: (typeQuestion) {
              if (typeQuestion != null) {
                this.typeQuestion = typeQuestion;
              }
            },
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                onPressed: () =>
                    widget.onCancel(_isNew ? null : widget.question),
                child: const Text('Cancelar'),
              ),
              const SizedBox(width: 8),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    widget.onSaved(
                      Question(
                        question.id,
                        hint,
                        label,
                        type: typeQuestion.toTypeQuestion,
                        isDeleted: question.isDeleted,
                      ),
                    );
                  }
                },
                child: Text(_isNew ? 'Adicionar' : 'Editar'),
              )
            ],
          ),
        ],
      ),
    );
  }
}
