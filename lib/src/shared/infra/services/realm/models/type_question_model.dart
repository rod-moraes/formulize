// ignore_for_file: avoid_equals_and_hash_code_on_mutable_classes

part of './generate/realm_models.dart';

@RealmModel()
class _TypeQuestion {
  @PrimaryKey()
  @MapTo('_id')
  late String id;
  late String title;
}

enum TypeQuestionForms {
  dropdown('0'),
  text('1'),
  checkbox('2'),
  datetime('3'),
  time('4'),
  switchType('5');

  final String id;
  const TypeQuestionForms(this.id);

  TypeQuestion get toTypeQuestion {
    return TypeQuestion(id, name);
  }

  static TypeQuestionForms? fromQuestion(TypeQuestion? question) {
    if (question == null) return null;
    return TypeQuestionForms.values.firstWhere(
      (element) => element.id == question.id && question.title == element.name,
      orElse: () => TypeQuestionForms.text,
    );
  }
}
