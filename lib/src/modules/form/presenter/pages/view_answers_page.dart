import 'package:flutter/material.dart';

import '../../../../shared/infra/services/realm/models/generate/realm_models.dart';

class ViewAnswersPage extends StatefulWidget {
  final Forms forms;
  const ViewAnswersPage({
    Key? key,
    required this.forms,
  }) : super(key: key);

  @override
  State<ViewAnswersPage> createState() => _ViewAnswersPageState();
}

class _ViewAnswersPageState extends State<ViewAnswersPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Resposta do ${widget.forms.title}'),
      ),
      body: ListView.builder(
        itemCount: widget.forms.answers.length,
        itemBuilder: (context, index) {
          final answer = widget.forms.answers[index];
          final name = answer.name.isEmpty ? 'Anônimo' : answer.name;
          final email = answer.email.isEmpty ? 'Sem e-mail' : answer.email;
          return ExpansionTile(
            title: ListTile(
              title: Text('Nome: $name'),
              subtitle: Text('E-mail: $email'),
            ),
            expandedAlignment: Alignment.topLeft,
            expandedCrossAxisAlignment: CrossAxisAlignment.start,
            childrenPadding: const EdgeInsets.symmetric(horizontal: 32),
            children: [
              Text('Id: ${answer.id}'),
              const SizedBox(height: 8),
              Text('Nome: $name'),
              const SizedBox(height: 8),
              Text('E-mail: $email'),
              const SizedBox(height: 8),
              ...answer.answers.map((ans) {
                final question =
                    ans.question?.type?.id == TypeQuestionForms.text.id
                        ? 'Pergunta: ${ans.question?.label}'
                        : 'Pergunta: ${ans.question?.hint}';

                final response =
                    ans.question?.type?.id == TypeQuestionForms.checkbox.id ||
                            ans.question?.type?.id ==
                                TypeQuestionForms.switchType.id
                        ? 'Resposta: ${ans.answer == '1' ? "Sim" : "Não"}'
                        : 'Resposta: ${ans.answer}';
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    '$question\n$response',
                  ),
                );
              })
            ],
          );
        },
      ),
    );
  }
}
