import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'app/app.dart';
import 'app/config/constants/enviroment.dart';
import 'app/config/constants/url_api.dart';
import 'app/data/datasources/local/helpers/storage.dart';
import 'app/data/datasources/remote/helpers/http_client.dart';
import 'app/inject_repositories.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// Initialize dotenv, hive store and http client
  await dotenv.load(fileName: '.env');
  await Hive.initFlutter();
  final box = await Hive.openBox('Preferences');
  final storage = Storage(box);

  final HttpClient http = HttpClient(
    dio: Dio(BaseOptions(
      baseUrl: UrlAPI.baseUrl,
      queryParameters: {'APIkey': Environment.apiKey},
    )),
    logsEnabled: true,
  );

  /// Inject repositories
  await injectRepositories(
    storage: storage,
    http: http,
  );
  runApp(const App());
}
