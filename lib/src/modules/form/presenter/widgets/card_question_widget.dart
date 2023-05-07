import 'package:flutter/material.dart';

import '../../../../shared/infra/services/realm/models/generate/realm_models.dart';

class CardQuestionWidget extends StatelessWidget {
  final Question question;
  final int index;
  final VoidCallback onTapEdit;
  final VoidCallback onTapDelete;
  const CardQuestionWidget({
    Key? key,
    required this.question,
    required this.index,
    required this.onTapEdit,
    required this.onTapDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTapEdit,
      trailing: IconButton(
        onPressed: onTapDelete,
        icon: const Icon(Icons.close, color: Colors.red),
      ),
      leading: CircleAvatar(child: Text((index + 1).toString())),
      title: Text('Questão label: ${question.label}'),
      subtitle: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Questão hint: ${question.hint}'),
          Text('Tipo de questão: ${question.type?.title}')
        ],
      ),
      isThreeLine: true,
    );
  }
}
