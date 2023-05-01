import 'dart:io';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:formulize/src/shared/infra/services/realm/models/generate/realm_models.dart';
import 'package:formulize/src/shared/infra/services/realm/realm_config.dart';

void main() async {
  /// For running Flutter widget and unit tests run the following command to
  /// install the required native binaries.
  ///
  /// `flutter pub run realm install`

  // Loading from a static string.
  dotenv.testLoad(fileInput: await File('.env').readAsString());

  final realm = await getRealmInstanceTest();
  test('Initial configuration Realm', () {
    final syncData = realm.all<Sync>();
    final configData = realm.all<Config>();
    final statusData = realm.all<Status>();
    final typeQuestionData = realm.all<TypeQuestion>();
    final questionData = realm.all<Question>();
    final answerData = realm.all<Answer>();
    final answerHeadData = realm.all<AnswerHead>();
    final formsData = realm.all<Forms>();

    expect(syncData.isNotEmpty, true);
    expect(syncData.length, 1);
    expect(auth.id, syncData.first.idDevice);
    expect(configData.isNotEmpty, true);
    expect(configData.length, 1);
    expect(
      configData.single.superUserPass,
      Config(auth.id, 'system', '12345').superUserPass,
    );
    expect(
      configData.single.themeModeName,
      Config(auth.id, 'system', '12345').themeModeName,
    );
    expect(statusData.isNotEmpty, true);
    expect(statusData.length, StatusForms.values.length);

    expect(typeQuestionData.isNotEmpty, true);
    expect(typeQuestionData.length, TypeQuestionForms.values.length);

    expect(questionData.isEmpty, true);
    expect(answerData.isEmpty, true);
    expect(answerHeadData.isEmpty, true);
    expect(formsData.isEmpty, true);
  });
}
