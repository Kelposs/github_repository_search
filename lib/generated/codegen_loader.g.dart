// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>> load(String fullPath, Locale locale ) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> ja_JP = {
  "app": {
    "name": "Git"
  },
  "app_bar": {
    "title": {
      "hintText": "レポジトリー名を入力してください"
    }
  },
  "home_screen": {
    "github_tile": {
      "language": {
        "provided": "言語",
        "null": "N/A"
      },
      "description": {
        "provided": "説明文",
        "null": "説明文はありません"
      },
      "stars": "Stars",
      "watchers": "Watchers",
      "issues": "Issues",
      "fork": "Forks"
    }
  }
};
static const Map<String, Map<String,dynamic>> mapLocales = {"ja_JP": ja_JP};
}
