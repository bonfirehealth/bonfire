// Package imports:
// import 'package:flutter_dotenv/flutter_dotenv.dart';

// Project imports:
import 'package:bonfirehealth/app/app.dart';
import 'package:bonfirehealth/bootstrap.dart';

void main() async {
  // await dotenv.load();
  await bootstrap(
    (String themeColor) => App(themeColour: themeColor),
    AppFlavor.production,
  );
}
