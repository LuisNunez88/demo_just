import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static String apiKey = dotenv.env['API_KEY'] ?? 'No exist an api key';
  static String demoEmail = dotenv.env['USER_EMAIL'] ?? 'example@example.com';
  static String demoPassword = dotenv.env['USER_PASSWORD'] ?? 'password';
}
