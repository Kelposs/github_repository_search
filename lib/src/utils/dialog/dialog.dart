import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:github_repository_search/src/export_box.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

bool _isErrorDialogDisplay = false;

Future<void> showErrorDialog(
  BuildContext context,
  String content,
) async {
  if (_isErrorDialogDisplay) {
    return;
  }
  await showPlatformDialog(
    context: context,
    builder: (_) => WillPopScope(
      child: PlatformAlertDialog(
        title: null,
        content: Text(content),
        actions: <Widget>[
          // Slidableで使うと"Looking up a deactivated widget's ancestor〜"エラーになるのでBuilderでラップ
          // 参考: https://zenn.dev/ryouhei_furugen/articles/2fa82ba62c88da
          Builder(
            builder: (context) {
              return PlatformDialogAction(
                child: PlatformText(
                  "xxxx",
                  // LocaleKeys.dialog_button_ok.tr(),
                  style: Constants.kDefaultTextStyle.copyWith(
                    color: AppColor.primaryColor,
                  ),
                ),
                onPressed: () => Navigator.pop(context),
              );
            },
          ),
        ],
      ),
      onWillPop: () async => false,
    ),
  ).then((value) => _isErrorDialogDisplay = false);
}

Future<void> showErrorDialogWithReload(
  BuildContext context,
  String content, {
  VoidCallback? onPressed,
}) async {
  if (_isErrorDialogDisplay) {
    return;
  }
  _isErrorDialogDisplay = true;
  await showPlatformDialog(
    context: context,
    builder: (_) => WillPopScope(
      child: PlatformAlertDialog(
        title: Text(LocaleKeys.errors_dialog.tr()),
        content: Text(content),
        actions: <Widget>[
          PlatformDialogAction(
            child: PlatformText(
              LocaleKeys.errors_button_reload.tr(),
              style: Constants.kDefaultTextStyle.copyWith(
                color: AppColor.primaryColor,
              ),
            ),
            onPressed: () {
              _isErrorDialogDisplay = false;

              onPressed?.call();
            },
          ),
        ],
      ),
      onWillPop: () async => false,
    ),
  ).then((value) => _isErrorDialogDisplay = false);
}

Future<void> showErrorDialogWithReloadAndCancel(
  BuildContext context,
  String content,
  VoidCallback? onPressed,
  VoidCallback? onCancel,
) async {
  if (_isErrorDialogDisplay) {
    return;
  }
  _isErrorDialogDisplay = true;
  await showPlatformDialog(
    context: context,
    builder: (_) => WillPopScope(
      child: PlatformAlertDialog(
        title: Text(LocaleKeys.errors_dialog.tr()),
        content: Text(content),
        actions: <Widget>[
          PlatformDialogAction(
            child: PlatformText(
              LocaleKeys.errors_button_reload.tr(),
            ),
            onPressed: () {
              onPressed?.call();
            },
          ),
          PlatformDialogAction(
            child: PlatformText(
              LocaleKeys.errors_button_cancel.tr(),
              style: Constants.kDefaultTextStyle.copyWith(
                color: AppColor.primaryColor,
              ),
            ),
            onPressed: () {
              onCancel?.call();
            },
          ),
        ],
      ),
      onWillPop: () async => false,
    ),
  ).then((value) => _isErrorDialogDisplay = false);
}
