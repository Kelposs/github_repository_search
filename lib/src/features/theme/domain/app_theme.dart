import 'package:github_repository_search/src/export_box.dart';
import 'package:flutter/material.dart';
import 'package:github_repository_search/src/features/theme/domain/system_brightness.dart';
import 'package:github_repository_search/src/utils/storage/app_pref_key.dart';

extension ThemeModeEx on ThemeMode {
  bool get isLight => this == ThemeMode.light;
  bool get isDark => this == ThemeMode.dark;
  bool get isAuto => this == ThemeMode.system;
}

final didChangedThemeProvider =
    StateNotifierProvider.autoDispose<DidChangedThemeNotifier, bool>(
  (ref) => DidChangedThemeNotifier(ref),
);

class DidChangedThemeNotifier extends StateNotifier<bool> {
  DidChangedThemeNotifier(AutoDisposeStateNotifierProviderRef ref)
      : _ref = ref,
        super(false) {
    _loadData();
  }

  final AutoDisposeStateNotifierProviderRef _ref;

  void _loadData() {
    state = _ref
            .read(sharedPrefServiceProvider)
            .getBool(AppPrefKey.didChangedThemeModeType.keyString) ??
        false;
  }

  void reload() {
    _loadData();
  }
}

final themeModeProvider =
    StateNotifierProvider.autoDispose<ThemeModeNotifier, ThemeMode>(
  (ref) => ThemeModeNotifier(ref),
  name: 'themeModeProvider',
);

class ThemeModeNotifier extends StateNotifier<ThemeMode> {
  ThemeModeNotifier(AutoDisposeStateNotifierProviderRef ref)
      : _ref = ref,
        super(ThemeMode.system) {
    _loadData();
  }

  final AutoDisposeStateNotifierProviderRef _ref;

  void _loadData() {
    final value = _ref
            .read(sharedPrefServiceProvider)
            .getInt(AppPrefKey.themeModeType.keyString) ??
        ThemeMode.system.index;

    final themeMode = ThemeMode.values[value];

    state = themeMode;
  }

  Future<void> changeMode(ThemeMode mode) async {
    final pref = _ref.read(sharedPrefServiceProvider);

    await pref.setBool(AppPrefKey.didChangedThemeModeType.keyString, true);
    await pref.setInt(AppPrefKey.themeModeType.keyString, mode.index);

    state = mode;
  }

  void changeAutoMode(bool useAuto) async {
    if (useAuto) {
      await changeMode(ThemeMode.system);

      _ref
          .read(systemBrightnessProvider(ThemeMode.system).notifier)
          .updateBrightness();

      _ref.read(didChangedThemeProvider.notifier).reload();

      return;
    }
  }
}

class AppTheme {
  static ThemeData get lightTheme {
    const primaryColor = AppColor.primaryColor;

    return ThemeData(
      brightness: Brightness.light,
      splashColor: AppColor.transparentColor,
      highlightColor: AppColor.transparentColor,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: primaryColor,
        selectedLabelStyle: Constants.kDefaultTextStyle,
        unselectedLabelStyle: Constants.kDefaultTextStyle,
      ),
      colorScheme: const ColorScheme.light(
        primary: primaryColor,
      ),
      iconTheme: const IconThemeData(
        color: primaryColor,
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateProperty.all(primaryColor),
      ),
    );
  }

  static ThemeData get darkColorTheme {
    const primaryColor = AppColor.primaryColor;

    return ThemeData(
      primaryColor: primaryColor,
      canvasColor: AppColor.darkBG,
      brightness: Brightness.dark,
      splashColor: AppColor.transparentColor,
      highlightColor: AppColor.transparentColor,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColor.darkBG,
      ),
      colorScheme: const ColorScheme.dark(
        primary: primaryColor,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: primaryColor,
        selectedLabelStyle: Constants.kDefaultTextStyle,
        unselectedLabelStyle: Constants.kDefaultTextStyle,
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateProperty.all(primaryColor),
      ),
    );
  }
}
