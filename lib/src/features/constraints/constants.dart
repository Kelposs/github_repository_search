import 'package:flutter/material.dart';
import 'package:github_repository_search/gen/fonts.gen.dart';
import 'package:github_repository_search/src/export_box.dart';

class Constants {
  static final kAppBarHeight = 48.h;

  /// アプリのカスタムフォントが設定されてTextStyle
  static const kDefaultTextStyle = TextStyle(
    fontFamily: FontFamily.roboto,
    fontFamilyFallback: [
      FontFamily.notoSansJP,
    ],
  );
}
