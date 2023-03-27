import 'package:flutter/material.dart';
import 'package:github_repository_search/src/export_box.dart';
import 'package:github_repository_search/src/features/home/presentation/home_screen.dart';

final GlobalKey<NavigatorState> navigatorKey =
    GlobalKey(debugLabel: 'Global Navigator');

class App extends ConsumerStatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  ConsumerState<App> createState() => _AppState();
}

class _AppState extends ConsumerState<App> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      //iPhone8サイズ(375×667)
      designSize: const Size(375, 667),
      minTextAdapt: true,
      splitScreenMode: false,
      builder: (context, child) {
        return MaterialApp(
          navigatorKey: navigatorKey,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkColorTheme,
          themeMode: ref.watch(themeModeProvider),
          home: child,
          builder: (BuildContext context, Widget? child) {
            return MediaQuery(
              // 端末の文字サイズ無効化
              data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
              child: child!,
            );
          },
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          onGenerateRoute: (settings) => AppRouter.onGenerateRoute(settings),
          navigatorObservers: [routeObserver],
        );
      },
      child: const HomeScreen(),
    );
  }
}

final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();
