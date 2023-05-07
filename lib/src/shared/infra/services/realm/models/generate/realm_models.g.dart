// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'realm_models.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

class Config extends _Config with RealmEntity, RealmObjectBase, RealmObject {
  Config(
    String id,
    String themeModeName,
    String superUserPass,
  ) {
    RealmObjectBase.set(this, '_id', id);
    RealmObjectBase.set(this, 'themeModeName', themeModeName);
    RealmObjectBase.set(this, 'superUserPass', superUserPass);
  }

  Config._();

  @override
  String get id => RealmObjectBase.get<String>(this, '_id') as String;
  @override
  set id(String value) => RealmObjectBase.set(this, '_id', value);

  @override
  String get themeModeName =>
      RealmObjectBase.get<String>(this, 'themeModeName') as String;
  @override
  set themeModeName(String value) =>
      RealmObjectBase.set(this, 'themeModeName', value);

  @override
  String get superUserPass =>
      RealmObjectBase.get<String>(this, 'superUserPass') as String;
  @override
  set superUserPass(String value) =>
      RealmObjectBase.set(this, 'superUserPass', value);

  @override
  Stream<RealmObjectChanges<Config>> get changes =>
      RealmObjectBase.getChanges<Config>(this);

  @override
  Config freeze() => RealmObjectBase.freezeObject<Config>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(Config._);
    return const SchemaObject(ObjectType.realmObject, Config, 'Config', [
      SchemaProperty('id', RealmPropertyType.string,
          mapTo: '_id', primaryKey: true),
      SchemaProperty('themeModeName', RealmPropertyType.string),
      SchemaProperty('superUserPass', RealmPropertyType.string),
    ]);
  }
}

class Sync extends _Sync with RealmEntity, RealmObjectBase, RealmObject {
  Sync(
    Uuid id,
    String idDevice, {
    DateTime? syncDate,
    String? status,
  }) {
    RealmObjectBase.set(this, '_id', id);
    RealmObjectBase.set(this, 'idDevice', idDevice);
    RealmObjectBase.set(this, 'syncDate', syncDate);
    RealmObjectBase.set(this, 'status', status);
  }

  Sync._();

  @override
  Uuid get id => RealmObjectBase.get<Uuid>(this, '_id') as Uuid;
  @override
  set id(Uuid value) => RealmObjectBase.set(this, '_id', value);

  @override
  String get idDevice =>
      RealmObjectBase.get<String>(this, 'idDevice') as String;
  @override
  set idDevice(String value) => RealmObjectBase.set(this, 'idDevice', value);

  @override
  DateTime? get syncDate =>
      RealmObjectBase.get<DateTime>(this, 'syncDate') as DateTime?;
  @override
  set syncDate(DateTime? value) => RealmObjectBase.set(this, 'syncDate', value);

  @override
  String? get status => RealmObjectBase.get<String>(this, 'status') as String?;
  @override
  set status(String? value) => RealmObjectBase.set(this, 'status', value);

  @override
  Stream<RealmObjectChanges<Sync>> get changes =>
      RealmObjectBase.getChanges<Sync>(this);

  @override
  Sync freeze() => RealmObjectBase.freezeObject<Sync>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(Sync._);
    return const SchemaObject(ObjectType.realmObject, Sync, 'Sync', [
      SchemaProperty('id', RealmPropertyType.uuid,
          mapTo: '_id', primaryKey: true),
      SchemaProperty('idDevice', RealmPropertyType.string),
      SchemaProperty('syncDate', RealmPropertyType.timestamp, optional: true),
      SchemaProperty('status', RealmPropertyType.string, optional: true),
    ]);
  }
}

class Status extends _Status with RealmEntity, RealmObjectBase, RealmObject {
  Status(
    String id,
    String title,
  ) {
    RealmObjectBase.set(this, '_id', id);
    RealmObjectBase.set(this, 'title', title);
  }

  Status._();

  @override
  String get id => RealmObjectBase.get<String>(this, '_id') as String;
  @override
  set id(String value) => RealmObjectBase.set(this, '_id', value);

  @override
  String get title => RealmObjectBase.get<String>(this, 'title') as String;
  @override
  set title(String value) => RealmObjectBase.set(this, 'title', value);

  @override
  Stream<RealmObjectChanges<Status>> get changes =>
      RealmObjectBase.getChanges<Status>(this);

  @override
  Status freeze() => RealmObjectBase.freezeObject<Status>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(Status._);
    return const SchemaObject(ObjectType.realmObject, Status, 'Status', [
      SchemaProperty('id', RealmPropertyType.string,
          mapTo: '_id', primaryKey: true),
      SchemaProperty('title', RealmPropertyType.string),
    ]);
  }
}

class TypeQuestion extends _TypeQuestion
    with RealmEntity, RealmObjectBase, RealmObject {
  TypeQuestion(
    String id,
    String title,
  ) {
    RealmObjectBase.set(this, '_id', id);
    RealmObjectBase.set(this, 'title', title);
  }

  TypeQuestion._();

  @override
  String get id => RealmObjectBase.get<String>(this, '_id') as String;
  @override
  set id(String value) => RealmObjectBase.set(this, '_id', value);

  @override
  String get title => RealmObjectBase.get<String>(this, 'title') as String;
  @override
  set title(String value) => RealmObjectBase.set(this, 'title', value);

  @override
  Stream<RealmObjectChanges<TypeQuestion>> get changes =>
      RealmObjectBase.getChanges<TypeQuestion>(this);

  @override
  TypeQuestion freeze() => RealmObjectBase.freezeObject<TypeQuestion>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(TypeQuestion._);
    return const SchemaObject(
        ObjectType.realmObject, TypeQuestion, 'TypeQuestion', [
      SchemaProperty('id', RealmPropertyType.string,
          mapTo: '_id', primaryKey: true),
      SchemaProperty('title', RealmPropertyType.string),
    ]);
  }
}

class Question extends _Question
    with RealmEntity, RealmObjectBase, RealmObject {
  static var _defaultsSet = false;

  Question(
    Uuid id,
    String idDevice,
    String hint,
    String label, {
    TypeQuestion? type,
    bool isDeleted = false,
  }) {
    if (!_defaultsSet) {
      _defaultsSet = RealmObjectBase.setDefaults<Question>({
        'isDeleted': false,
      });
    }
    RealmObjectBase.set(this, '_id', id);
    RealmObjectBase.set(this, 'idDevice', idDevice);
    RealmObjectBase.set(this, 'hint', hint);
    RealmObjectBase.set(this, 'label', label);
    RealmObjectBase.set(this, 'type', type);
    RealmObjectBase.set(this, 'isDeleted', isDeleted);
  }

  Question._();

  @override
  Uuid get id => RealmObjectBase.get<Uuid>(this, '_id') as Uuid;
  @override
  set id(Uuid value) => RealmObjectBase.set(this, '_id', value);

  @override
  String get idDevice =>
      RealmObjectBase.get<String>(this, 'idDevice') as String;
  @override
  set idDevice(String value) => RealmObjectBase.set(this, 'idDevice', value);

  @override
  String get hint => RealmObjectBase.get<String>(this, 'hint') as String;
  @override
  set hint(String value) => RealmObjectBase.set(this, 'hint', value);

  @override
  String get label => RealmObjectBase.get<String>(this, 'label') as String;
  @override
  set label(String value) => RealmObjectBase.set(this, 'label', value);

  @override
  TypeQuestion? get type =>
      RealmObjectBase.get<TypeQuestion>(this, 'type') as TypeQuestion?;
  @override
  set type(covariant TypeQuestion? value) =>
      RealmObjectBase.set(this, 'type', value);

  @override
  bool get isDeleted => RealmObjectBase.get<bool>(this, 'isDeleted') as bool;
  @override
  set isDeleted(bool value) => RealmObjectBase.set(this, 'isDeleted', value);

  @override
  Stream<RealmObjectChanges<Question>> get changes =>
      RealmObjectBase.getChanges<Question>(this);

  @override
  Question freeze() => RealmObjectBase.freezeObject<Question>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(Question._);
    return const SchemaObject(ObjectType.realmObject, Question, 'Question', [
      SchemaProperty('id', RealmPropertyType.uuid,
          mapTo: '_id', primaryKey: true),
      SchemaProperty('idDevice', RealmPropertyType.string),
      SchemaProperty('hint', RealmPropertyType.string),
      SchemaProperty('label', RealmPropertyType.string),
      SchemaProperty('type', RealmPropertyType.object,
          optional: true, linkTarget: 'TypeQuestion'),
      SchemaProperty('isDeleted', RealmPropertyType.bool),
    ]);
  }
}

class Answer extends _Answer with RealmEntity, RealmObjectBase, RealmObject {
  static var _defaultsSet = false;

  Answer(
    Uuid id,
    String idDevice,
    String answer, {
    Question? question,
    bool isDeleted = false,
    Iterable<String> answers = const [],
  }) {
    if (!_defaultsSet) {
      _defaultsSet = RealmObjectBase.setDefaults<Answer>({
        'isDeleted': false,
      });
    }
    RealmObjectBase.set(this, '_id', id);
    RealmObjectBase.set(this, 'idDevice', idDevice);
    RealmObjectBase.set(this, 'question', question);
    RealmObjectBase.set(this, 'answer', answer);
    RealmObjectBase.set(this, 'isDeleted', isDeleted);
    RealmObjectBase.set<RealmList<String>>(
        this, 'answers', RealmList<String>(answers));
  }

  Answer._();

  @override
  Uuid get id => RealmObjectBase.get<Uuid>(this, '_id') as Uuid;
  @override
  set id(Uuid value) => RealmObjectBase.set(this, '_id', value);

  @override
  String get idDevice =>
      RealmObjectBase.get<String>(this, 'idDevice') as String;
  @override
  set idDevice(String value) => RealmObjectBase.set(this, 'idDevice', value);

  @override
  Question? get question =>
      RealmObjectBase.get<Question>(this, 'question') as Question?;
  @override
  set question(covariant Question? value) =>
      RealmObjectBase.set(this, 'question', value);

  @override
  String get answer => RealmObjectBase.get<String>(this, 'answer') as String;
  @override
  set answer(String value) => RealmObjectBase.set(this, 'answer', value);

  @override
  RealmList<String> get answers =>
      RealmObjectBase.get<String>(this, 'answers') as RealmList<String>;
  @override
  set answers(covariant RealmList<String> value) =>
      throw RealmUnsupportedSetError();

  @override
  bool get isDeleted => RealmObjectBase.get<bool>(this, 'isDeleted') as bool;
  @override
  set isDeleted(bool value) => RealmObjectBase.set(this, 'isDeleted', value);

  @override
  Stream<RealmObjectChanges<Answer>> get changes =>
      RealmObjectBase.getChanges<Answer>(this);

  @override
  Answer freeze() => RealmObjectBase.freezeObject<Answer>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(Answer._);
    return const SchemaObject(ObjectType.realmObject, Answer, 'Answer', [
      SchemaProperty('id', RealmPropertyType.uuid,
          mapTo: '_id', primaryKey: true),
      SchemaProperty('idDevice', RealmPropertyType.string),
      SchemaProperty('question', RealmPropertyType.object,
          optional: true, linkTarget: 'Question'),
      SchemaProperty('answer', RealmPropertyType.string),
      SchemaProperty('answers', RealmPropertyType.string,
          collectionType: RealmCollectionType.list),
      SchemaProperty('isDeleted', RealmPropertyType.bool),
    ]);
  }
}

class AnswerHead extends _AnswerHead
    with RealmEntity, RealmObjectBase, RealmObject {
  static var _defaultsSet = false;

  AnswerHead(
    Uuid id,
    String idDevice,
    String name,
    String email, {
    bool isDeleted = false,
    Iterable<Answer> answers = const [],
  }) {
    if (!_defaultsSet) {
      _defaultsSet = RealmObjectBase.setDefaults<AnswerHead>({
        'isDeleted': false,
      });
    }
    RealmObjectBase.set(this, '_id', id);
    RealmObjectBase.set(this, 'idDevice', idDevice);
    RealmObjectBase.set(this, 'name', name);
    RealmObjectBase.set(this, 'email', email);
    RealmObjectBase.set(this, 'isDeleted', isDeleted);
    RealmObjectBase.set<RealmList<Answer>>(
        this, 'answers', RealmList<Answer>(answers));
  }

  AnswerHead._();

  @override
  Uuid get id => RealmObjectBase.get<Uuid>(this, '_id') as Uuid;
  @override
  set id(Uuid value) => RealmObjectBase.set(this, '_id', value);

  @override
  String get idDevice =>
      RealmObjectBase.get<String>(this, 'idDevice') as String;
  @override
  set idDevice(String value) => RealmObjectBase.set(this, 'idDevice', value);

  @override
  String get name => RealmObjectBase.get<String>(this, 'name') as String;
  @override
  set name(String value) => RealmObjectBase.set(this, 'name', value);

  @override
  String get email => RealmObjectBase.get<String>(this, 'email') as String;
  @override
  set email(String value) => RealmObjectBase.set(this, 'email', value);

  @override
  RealmList<Answer> get answers =>
      RealmObjectBase.get<Answer>(this, 'answers') as RealmList<Answer>;
  @override
  set answers(covariant RealmList<Answer> value) =>
      throw RealmUnsupportedSetError();

  @override
  bool get isDeleted => RealmObjectBase.get<bool>(this, 'isDeleted') as bool;
  @override
  set isDeleted(bool value) => RealmObjectBase.set(this, 'isDeleted', value);

  @override
  Stream<RealmObjectChanges<AnswerHead>> get changes =>
      RealmObjectBase.getChanges<AnswerHead>(this);

  @override
  AnswerHead freeze() => RealmObjectBase.freezeObject<AnswerHead>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(AnswerHead._);
    return const SchemaObject(
        ObjectType.realmObject, AnswerHead, 'AnswerHead', [
      SchemaProperty('id', RealmPropertyType.uuid,
          mapTo: '_id', primaryKey: true),
      SchemaProperty('idDevice', RealmPropertyType.string),
      SchemaProperty('name', RealmPropertyType.string),
      SchemaProperty('email', RealmPropertyType.string),
      SchemaProperty('answers', RealmPropertyType.object,
          linkTarget: 'Answer', collectionType: RealmCollectionType.list),
      SchemaProperty('isDeleted', RealmPropertyType.bool),
    ]);
  }
}

class Forms extends _Forms with RealmEntity, RealmObjectBase, RealmObject {
  static var _defaultsSet = false;

  Forms(
    Uuid id,
    String idDevice,
    String title, {
    Status? status,
    bool isDeleted = false,
    Iterable<Question> questions = const [],
    Iterable<AnswerHead> answers = const [],
  }) {
    if (!_defaultsSet) {
      _defaultsSet = RealmObjectBase.setDefaults<Forms>({
        'isDeleted': false,
      });
    }
    RealmObjectBase.set(this, '_id', id);
    RealmObjectBase.set(this, 'idDevice', idDevice);
    RealmObjectBase.set(this, 'title', title);
    RealmObjectBase.set(this, 'status', status);
    RealmObjectBase.set(this, 'isDeleted', isDeleted);
    RealmObjectBase.set<RealmList<Question>>(
        this, 'questions', RealmList<Question>(questions));
    RealmObjectBase.set<RealmList<AnswerHead>>(
        this, 'answers', RealmList<AnswerHead>(answers));
  }

  Forms._();

  @override
  Uuid get id => RealmObjectBase.get<Uuid>(this, '_id') as Uuid;
  @override
  set id(Uuid value) => RealmObjectBase.set(this, '_id', value);

  @override
  String get idDevice =>
      RealmObjectBase.get<String>(this, 'idDevice') as String;
  @override
  set idDevice(String value) => RealmObjectBase.set(this, 'idDevice', value);

  @override
  String get title => RealmObjectBase.get<String>(this, 'title') as String;
  @override
  set title(String value) => RealmObjectBase.set(this, 'title', value);

  @override
  Status? get status => RealmObjectBase.get<Status>(this, 'status') as Status?;
  @override
  set status(covariant Status? value) =>
      RealmObjectBase.set(this, 'status', value);

  @override
  RealmList<Question> get questions =>
      RealmObjectBase.get<Question>(this, 'questions') as RealmList<Question>;
  @override
  set questions(covariant RealmList<Question> value) =>
      throw RealmUnsupportedSetError();

  @override
  RealmList<AnswerHead> get answers =>
      RealmObjectBase.get<AnswerHead>(this, 'answers') as RealmList<AnswerHead>;
  @override
  set answers(covariant RealmList<AnswerHead> value) =>
      throw RealmUnsupportedSetError();

  @override
  bool get isDeleted => RealmObjectBase.get<bool>(this, 'isDeleted') as bool;
  @override
  set isDeleted(bool value) => RealmObjectBase.set(this, 'isDeleted', value);

  @override
  Stream<RealmObjectChanges<Forms>> get changes =>
      RealmObjectBase.getChanges<Forms>(this);

  @override
  Forms freeze() => RealmObjectBase.freezeObject<Forms>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(Forms._);
    return const SchemaObject(ObjectType.realmObject, Forms, 'Forms', [
      SchemaProperty('id', RealmPropertyType.uuid,
          mapTo: '_id', primaryKey: true),
      SchemaProperty('idDevice', RealmPropertyType.string),
      SchemaProperty('title', RealmPropertyType.string),
      SchemaProperty('status', RealmPropertyType.object,
          optional: true, linkTarget: 'Status'),
      SchemaProperty('questions', RealmPropertyType.object,
          linkTarget: 'Question', collectionType: RealmCollectionType.list),
      SchemaProperty('answers', RealmPropertyType.object,
          linkTarget: 'AnswerHead', collectionType: RealmCollectionType.list),
      SchemaProperty('isDeleted', RealmPropertyType.bool),
    ]);
  }
}
