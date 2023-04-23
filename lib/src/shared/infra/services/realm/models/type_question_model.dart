part of './generate/realm_models.dart';

@RealmModel()
class _TypeQuestion {
  @PrimaryKey()
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
}
