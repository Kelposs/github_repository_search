import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:github_repository_search/src/export_box.dart';
import 'package:github_repository_search/src/features/constraints/constants.dart';
import 'package:github_repository_search/src/features/theme/data/theme_repository.dart';
import 'package:github_repository_search/src/utils/dialog/sheet_with_observer_widget.dart';
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

Future<bool> showQuitAppDialog(
  BuildContext context,
) async {
  return showPlatformDialog<bool>(
    context: context,
    builder: (_) => WillPopScope(
      child: PlatformAlertDialog(
        content: Text(
          "xxxx",
        ),
        actions: <Widget>[
          PlatformDialogAction(
            child: PlatformText(
              "aaaa",
              style: Constants.kDefaultTextStyle.copyWith(),
            ),
            onPressed: () => Navigator.pop(context, false),
          ),
          PlatformDialogAction(
            child: PlatformText(
              "xxx",
              style: Constants.kDefaultTextStyle.copyWith(
                color: AppColor.primaryColor,
              ),
            ),
            onPressed: () => Navigator.pop(context, true),
          ),
        ],
      ),
      onWillPop: () async => false,
    ),
  ).then((value) => value ?? false);
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
        title: Text(
          "xxxx",
        ),
        content: Text(content),
        actions: <Widget>[
          PlatformDialogAction(
            child: PlatformText(
              "xxx",
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
        title: Text(
          "xxxx",
          // LocaleKeys.dialog_title_error.tr()
        ),
        content: Text(content),
        actions: <Widget>[
          PlatformDialogAction(
            child: PlatformText("z"
                // LocaleKeys.dialog_button_reload.tr()
                ),
            onPressed: () {
              onPressed?.call();
            },
          ),
          PlatformDialogAction(
            child: PlatformText(
              'キャンセル', //LocaleKeys.dialog_button_cancel.tr(),
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

// ignore: long-parameter-list
Future<void> showErrorDialogWithBtn(
  BuildContext context,
  String title,
  String content,
  String btn,
  VoidCallback onPressed,
) async {
  if (_isErrorDialogDisplay) {
    return;
  }
  _isErrorDialogDisplay = true;
  await showPlatformDialog(
    context: context,
    builder: (_) => WillPopScope(
      child: PlatformAlertDialog(
        title: Text(title),
        content: Text(content),
        actions: <Widget>[
          PlatformDialogAction(
            child: PlatformText(
              btn,
              style: Constants.kDefaultTextStyle.copyWith(
                color: AppColor.primaryColor,
              ),
            ),
            onPressed: () {
              _isErrorDialogDisplay = false;

              onPressed();
            },
          ),
        ],
      ),
      onWillPop: () async => false,
    ),
  ).then((value) {
    _isErrorDialogDisplay = false;
  });
}

Future<void> showInfoDialog(
  BuildContext context,
  String content, {
  VoidCallback? onPressed,
}) async {
  await showPlatformDialog(
    context: context,
    builder: (_) => WillPopScope(
      child: PlatformAlertDialog(
        content: Text(content),
        actions: <Widget>[
          PlatformDialogAction(
            child: PlatformText(
              "xxx",
              // LocaleKeys.dialog_button_ok.tr(),
              style: Constants.kDefaultTextStyle.copyWith(
                color: AppColor.primaryColor,
              ),
            ),
            onPressed: onPressed,
          ),
        ],
      ),
      onWillPop: () async => false,
    ),
  );
}

Future<void> showConfirmDialog(
  BuildContext context,
  String btn,
  String content, {
  VoidCallback? onPressed,
}) async {
  await showPlatformDialog(
    context: context,
    builder: (_) => WillPopScope(
      child: PlatformAlertDialog(
        title: Text("z"
            // LocaleKeys.dialog_title_confirm.tr()
            ),
        content: Text(content),
        actions: <Widget>[
          PlatformDialogAction(
            child: PlatformText(
              btn,
              style: Constants.kDefaultTextStyle.copyWith(
                color: AppColor.primaryColor,
              ),
            ),
            onPressed: onPressed,
          ),
          PlatformDialogAction(
            child: PlatformText(
              "x",
              // LocaleKeys.dialog_button_cancel.tr(),
              style: Constants.kDefaultTextStyle.copyWith(
                color: AppColor.primaryColor,
              ),
            ),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
      onWillPop: () async => false,
    ),
  );
}

Future<void> showConfirmDialogCheckBox(
  BuildContext context,
  String btn,
  Widget content, {
  VoidCallback? onPressed,
}) async {
  await showPlatformDialog(
    context: context,
    builder: (_) => WillPopScope(
      child: PlatformAlertDialog(
        title: Text(
          "x",
          // LocaleKeys.dialog_title_confirm.tr()
        ),
        content: content,
        actions: <Widget>[
          PlatformDialogAction(
            child: PlatformText(
              btn,
              style: Constants.kDefaultTextStyle.copyWith(
                color: AppColor.primaryColor,
              ),
            ),
            onPressed: onPressed,
          ),
          PlatformDialogAction(
            child: PlatformText(
              "x",
              // LocaleKeys.dialog_button_cancel.tr(),
              style: Constants.kDefaultTextStyle.copyWith(
                color: AppColor.primaryColor,
              ),
            ),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
      onWillPop: () async => false,
    ),
  );
}

Future<void> showToast(
  BuildContext context,
  String msg,
  ThemeRepository themeRepo,
) async {
  FToast fToast = FToast();
  fToast.init(context);

  Widget toast = Container(
    padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(23.r),
      color: themeRepo.toast,
    ),
    child: Text(
      msg,
      style: Constants.kDefaultTextStyle.copyWith(
        color: themeRepo.subText2,
        fontSize: 14.sp,
      ),
    ),
  );

  fToast.showToast(
    child: toast,
    gravity: ToastGravity.BOTTOM,
    toastDuration: const Duration(seconds: 2),
  );
}

Future<void> showSessionTimeoutSlideDialog(
  BuildContext context,
  WidgetRef ref,
  bool isAuto,
) async {
  if (ref.read(isShowBottomSheet)) {
    ref.read(isShowBottomSheet.notifier).state = false;
    Navigator.pop(context);
  }

  if (_isErrorDialogDisplay) {
    return;
  }

  return showPlatformDialog<bool>(
    context: context,
    builder: (_) => WillPopScope(
      child: PlatformAlertDialog(
        title: Text(
          "",
          // LocaleKeys.dialog_title_error.tr()
        ),
        content: Text(
          isAuto
              ? "LocaleKeys.apiError_system_sessionTimeoutWhenAutoLogin.tr()"
              : "LocaleKeys.apiError_system_sessionTimeout.tr()",
        ),
        actions: <Widget>[
          Builder(
            builder: (context) {
              return PlatformDialogAction(
                  child: PlatformText(
                    "LocaleKeys.dialog_button_close.tr()",
                    style: Constants.kDefaultTextStyle.copyWith(
                      color: AppColor.primaryColor,
                    ),
                  ),
                  onPressed: () async {
                    _isErrorDialogDisplay = false;
                    Navigator.of(context).pushNamedAndRemoveUntil(
                      AppRoutes.launch,
                      // AppRoutes.signIn,
                      (route) => false,
                    );
                  });
            },
          ),
        ],
      ),
      onWillPop: () async => false,
    ),
  ).then((value) => _isErrorDialogDisplay = false);
}
