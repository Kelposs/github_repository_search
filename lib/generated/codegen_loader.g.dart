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
  },
  "errors": {
    "dialog": "エラー",
    "button": {
      "ok": "OK",
      "yes": "はい",
      "no": "いいえ",
      "reload": "再読み込み",
      "cancel": "キャンセル",
      "close": "閉じる"
    },
    "not_modified": "要求されたコンテンツは前回送信以降更新されていない。",
    "validation_failed": "サーバー側がリクエストを理解しているにもかかわらず、\n処理ができない。",
    "service_unavailable": "サービスが一時的に利用不可。",
    "offline": "インターネット接続を確認してください。",
    "exceed": "APIコールの上限を超えました。\n少々お待ちください。",
    "undefined": "エラーが発生しました。\nしばらく時間をおいてから再度お試し下さい。"
  }
};
static const Map<String, Map<String,dynamic>> mapLocales = {"ja_JP": ja_JP};
}
