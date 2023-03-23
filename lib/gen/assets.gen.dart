/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  $AssetsImagesIconGen get icon => const $AssetsImagesIconGen();
}

class $AssetsTranslationsGen {
  const $AssetsTranslationsGen();

  /// File path: assets/translations/ja-JP.json
  String get jaJP => 'assets/translations/ja-JP.json';

  /// List of all assets
  List<String> get values => [jaJP];
}

class $AssetsImagesIconGen {
  const $AssetsImagesIconGen();

  /// File path: assets/images/icon/icon_fork_dark.svg
  SvgGenImage get iconForkDark =>
      const SvgGenImage('assets/images/icon/icon_fork_dark.svg');

  /// File path: assets/images/icon/icon_fork_light.svg
  SvgGenImage get iconForkLight =>
      const SvgGenImage('assets/images/icon/icon_fork_light.svg');

  /// File path: assets/images/icon/icon_github_dark.svg
  SvgGenImage get iconGithubDark =>
      const SvgGenImage('assets/images/icon/icon_github_dark.svg');

  /// File path: assets/images/icon/icon_github_grey.svg
  SvgGenImage get iconGithubGrey =>
      const SvgGenImage('assets/images/icon/icon_github_grey.svg');

  /// File path: assets/images/icon/icon_github_light.svg
  SvgGenImage get iconGithubLight =>
      const SvgGenImage('assets/images/icon/icon_github_light.svg');

  /// File path: assets/images/icon/icon_issues_dark.svg
  SvgGenImage get iconIssuesDark =>
      const SvgGenImage('assets/images/icon/icon_issues_dark.svg');

  /// File path: assets/images/icon/icon_issues_light.svg
  SvgGenImage get iconIssuesLight =>
      const SvgGenImage('assets/images/icon/icon_issues_light.svg');

  /// File path: assets/images/icon/icon_star_dark.svg
  SvgGenImage get iconStarDark =>
      const SvgGenImage('assets/images/icon/icon_star_dark.svg');

  /// File path: assets/images/icon/icon_star_light.svg
  SvgGenImage get iconStarLight =>
      const SvgGenImage('assets/images/icon/icon_star_light.svg');

  /// File path: assets/images/icon/icon_watchers_dark.svg
  SvgGenImage get iconWatchersDark =>
      const SvgGenImage('assets/images/icon/icon_watchers_dark.svg');

  /// File path: assets/images/icon/icon_watchers_light.svg
  SvgGenImage get iconWatchersLight =>
      const SvgGenImage('assets/images/icon/icon_watchers_light.svg');

  /// List of all assets
  List<SvgGenImage> get values => [
        iconForkDark,
        iconForkLight,
        iconGithubDark,
        iconGithubGrey,
        iconGithubLight,
        iconIssuesDark,
        iconIssuesLight,
        iconStarDark,
        iconStarLight,
        iconWatchersDark,
        iconWatchersLight
      ];
}

class Assets {
  Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsTranslationsGen translations = $AssetsTranslationsGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider() => AssetImage(_assetName);

  String get path => _assetName;

  String get keyName => _assetName;
}

class SvgGenImage {
  const SvgGenImage(this._assetName);

  final String _assetName;

  SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    SvgTheme theme = const SvgTheme(),
    ColorFilter? colorFilter,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated Clip? clipBehavior,
    @deprecated bool cacheColorFilter = false,
  }) {
    return SvgPicture.asset(
      _assetName,
      key: key,
      matchTextDirection: matchTextDirection,
      bundle: bundle,
      package: package,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      theme: theme,
      colorFilter: colorFilter,
      color: color,
      colorBlendMode: colorBlendMode,
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
