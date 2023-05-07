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

  Widget Function({
    required Question data,
    required void Function(String) onChanged,
    required FocusNode focusNode,
    required void Function(String)? onFieldSubmitted,
    required void Function()? onCallbackNoValid,
    String? initialValue,
    Key? key,
  }) get widget {
    switch (this) {
      case TypeQuestionForms.text:
        return FieldTextCustom.new;
      case TypeQuestionForms.checkbox:
        return FieldCheckCustom.new;
      case TypeQuestionForms.datetime:
        return FieldDateCustom.new;
      case TypeQuestionForms.switchType:
        return FieldSwitchCustom.new;
      case TypeQuestionForms.time:
        return FieldTimeCustom.new;
    }
  }

  static TypeQuestionForms? fromQuestion(TypeQuestion? question) {
    if (question == null) return null;
    return TypeQuestionForms.values.firstWhere(
      (element) => element.id == question.id && question.title == element.name,
      orElse: () => TypeQuestionForms.text,
    );
  }
}
