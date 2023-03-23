import 'dart:io';
import 'package:flutter/material.dart';
import 'package:github_repository_search/app.dart';
import 'package:github_repository_search/src/export_box.dart';
import 'package:github_repository_search/src/utils/logger/provider_logger.dart';
import 'package:github_repository_search/src/utils/storage/shared_pref_service.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

late final SharedPreferences sharedPreferences;

late final Provider<SharedPrefService> sharedPrefServiceProvider;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Future.wait([
    Future(() async {
      await EasyLocalization.ensureInitialized();
      HttpOverrides.global = MyHttpOverrides();
      sharedPreferences = await SharedPreferences.getInstance();
      sharedPrefServiceProvider = Provider<SharedPrefService>((ref) {
        return SharedPrefService(sharedPreferences);
      });
    }),
  ]);
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('ja', 'JP')],
      path: 'assets/translations',
      fallbackLocale: const Locale('ja', 'JP'),
      assetLoader: const CodegenLoader(),
      child: ProviderScope(
        observers: [
          ProviderLogger(),
        ],
        child: const App(),
      ),
    ),
  );
}

final logger = Logger(
  level: Level.info,
  printer: PrettyPrinter(
    methodCount: 0,
    errorMethodCount: 8,
    lineLength: 120,
    colors: !Platform.isIOS,
    // iOSで色をつけると表示が崩れるため
    printEmojis: false,
    printTime: false,
  ),
);

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
