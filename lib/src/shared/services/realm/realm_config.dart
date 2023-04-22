import 'package:realm/realm.dart';

LocalConfiguration config = Configuration.local(
  [
    // ConfigurationModel.schema,
    // Task.schema,
    // TaskBoard.schema,
  ],
  initialDataCallback: (realm) {},
);
