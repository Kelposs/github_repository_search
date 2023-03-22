import 'package:flutter/material.dart';
import 'package:github_repository_search/src/export_box.dart';
import 'package:github_repository_search/src/features/theme/domain/system_brightness.dart';

final themeRepoProvider = StateProvider.autoDispose(
  (ref) {
    final themeMode = ref.watch(themeModeProvider);

    return ThemeRepository(
      themeMode,
      ref.watch(systemBrightnessProvider(themeMode)),
    );
  },
  name: 'themeRepoProvider',
);

class ThemeRepository {
  late final bool isDarkMode;
  late final AppStyle style;

  ThemeRepository(ThemeMode mode, Brightness systemBightness) {
    isDarkMode = mode.isAuto
        ? systemBightness == Brightness.dark
        : mode == ThemeMode.dark;
    style = isDarkMode ? AppStyle.dark() : AppStyle.light();
  }

  bool get isLightMode => !isDarkMode;

  Color get bg {
    return style.bg;
  }

  /// テキストカラー
  Color get mainText {
    return style.mainTextColor;
  }

  Color get subText1 {
    return style.subText1;
  }

  Color get subText2 {
    return style.subText2;
  }

  Color get subText3 {
    return style.subText3;
  }

  Color get subText4 {
    return style.subText4;
  }

  Color get subText5 {
    return style.subText5;
  }

  Color get appleBtnText {
    return style.appleBtnText;
  }

  Color get mailBtnText {
    return style.mailBtnText;
  }

  /// テキストフィールド
  Color get textFieldBg {
    return style.textFieldBgColor;
  }

  Color get textFieldHint {
    return style.hintText;
  }

  /// ボタン
  Color get btnText {
    return style.btnTextColor;
  }

  Color get btnText2 {
    return style.btnTextColor2;
  }

  Color get disableBtnText {
    return style.disableBtnTextColor;
  }

  Color get btnPrimary {
    return style.btnColor;
  }

  Color get disableBtn {
    return style.disableBtn;
  }

  Color get appleBtnColor {
    return style.appleBtnColor;
  }

  Color get mailBtnColor {
    return style.mailBtnColor;
  }

  /// アイコン
  Color get appleIconColor {
    return style.appleIconColor;
  }

  Color get mailIconColor {
    return style.mailIconColor;
  }

  Color get disableCheckBoxColor {
    return style.disableCheckBoxColor;
  }

  Color get primaryColor {
    return style.primaryColor;
  }

  Color get disableTabTextColor {
    return style.disableTabTextColor;
  }

  Color get addIconDisableBgColor {
    return style.addIconDisableBgColor;
  }

  Color get addIconDisableColor {
    return style.addIconDisableColor;
  }

  Color get disableValueColor {
    return style.disableValueColor;
  }

  Color get toast {
    return style.toast;
  }

  /// Disable
  Color get disable {
    return style.disableColor;
  }

  /// Flat Color
  Color get flat {
    return style.flatColor;
  }

  @override
  String toString() {
    return 'ThemeRepository(isDarkMode: $isDarkMode)';
  }
}
