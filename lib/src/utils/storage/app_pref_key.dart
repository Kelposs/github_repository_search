enum AppPrefKey {
  // Secure ===============

  /// カラーモードを変更したか
  didChangedThemeModeType,

  /// カラーモード
  themeModeType,
}

extension AppPrefKeyEx on AppPrefKey {
  String get keyString {
    return name;
  }
}
