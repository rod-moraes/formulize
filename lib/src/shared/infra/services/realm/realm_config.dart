import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:realm/realm.dart';

import 'models/generate/realm_models.dart';

final app = App(AppConfiguration(dotenv.env['APPID_MONGODB'] ?? ''));
bool initialDataCallback = false;
User? _auth;

User get auth {
  if (_auth == null) throw 'Ops, você não está autenticado!';
  return _auth!;
}

Future<User> get user async {
  final currentUser = app.currentUser;
  if (currentUser != null) return currentUser;
  initialDataCallback = true;
  return app.logIn(Credentials.anonymous());
}

FlexibleSyncConfiguration config(User user) => Configuration.flexibleSync(
      user,
      [
        Sync.schema,
        Config.schema,
        Status.schema,
        TypeQuestion.schema,
        Question.schema,
        Answer.schema,
        AnswerHead.schema,
        Forms.schema,
      ],
    );

void _configSubscriptions(Realm realm) {
  realm.subscriptions.update((mutableSubscriptions) {
    mutableSubscriptions
      ..add(
        realm.query<Config>(r'id == $0', [auth.id]),
        update: true,
      )
      ..add(
        realm.query<Sync>(r'idDevice == $0', [auth.id]),
        update: true,
      )
      ..add(
        realm.all<Status>(),
        update: true,
      )
      ..add(
        realm.all<TypeQuestion>(),
        update: true,
      );
  });
}

void _initialDataConfigRealm(Realm realm) {
  realm
    ..write(() => realm.add(Config(auth.id, 'system', '12345')))
    ..write(
      () => realm.add(Sync(Uuid.v4(), auth.id, syncDate: DateTime.now())),
    );
  for (final status in StatusForms.values) {
    realm.write(() => realm.add(Status(status.id, status.title)));
  }
  for (final typeQuestion in TypeQuestionForms.values) {
    realm.write(
      () => realm.add(TypeQuestion(typeQuestion.id, typeQuestion.name)),
    );
  }
}

Future<Realm> getRealmInstanceTest() async {
  _auth = await user;
  final realm = Realm(config(auth));
  realm.syncSession.pause();
  _configSubscriptions(realm);
  if (initialDataCallback) {
    _initialDataConfigRealm(realm);
  }
  return realm;
}

Future<Realm> getRealmInstance() async {
  _auth = await user;
  final realm = Realm(config(auth));
  _configSubscriptions(realm);
  if (initialDataCallback) {
    realm.syncSession.resume();
    _initialDataConfigRealm(realm);
    await realm.syncSession.waitForDownload();
    await realm.syncSession.waitForUpload();
  }
  realm.syncSession.pause();
  return realm;
}
