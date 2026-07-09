import 'package:flutter_dotenv/flutter_dotenv.dart';

class Strings {
  Strings._();

  static const String appName = 'Sudani';
  static const String eng = "en";
  static const String arb = "ar";
  static const String envLocation = "assets/.env";
  static const String languageCode = "languageCode";
  static const String openSans = "OpenSans";
  static const String ptSans = "PTSans";
  static final String googleClientId = dotenv.env['GOOGLE_CLIENT_ID']!;
  static const String uidKey = "user_uid";
  static const String usersCollection = "users";
  static const String currentLocation = "currentLocation";
}