import 'package:github_repository_search/gen/assets.gen.dart';
import 'package:github_repository_search/src/export_box.dart';

enum InformationType {
  /// 言語
  language,

  /// stars
  stars,

  /// forks
  forks,

  /// issues
  issues,

  /// watchers
  watchers,
}

extension InformationTypeEx on InformationType {
  //TODO
  //ダークとライトモード作成しないといけない
  static final Map<InformationType, Map<String, String>> _typeMap = {
    InformationType.language: {
      Assets.images.icon.iconLanguageDark.path:
          LocaleKeys.home_screen_github_tile_language_provided.tr(),
    },
    InformationType.stars: {
      Assets.images.icon.iconStarDark.path:
          LocaleKeys.home_screen_github_tile_stars.tr(),
    },
    InformationType.watchers: {
      Assets.images.icon.iconWatchersDark.path:
          LocaleKeys.home_screen_github_tile_watchers.tr(),
    },
    InformationType.forks: {
      Assets.images.icon.iconForkDark.path:
          LocaleKeys.home_screen_github_tile_fork.tr(),
    },
    InformationType.issues: {
      Assets.images.icon.iconIssuesDark.path:
          LocaleKeys.home_screen_github_tile_issues.tr(),
    },
  };

  Map<String, String> get informationType => _typeMap[this]!;
}
