import 'package:flutter/material.dart';

import 'package:github_repository_search/src/export_box.dart';
import 'package:github_repository_search/src/utils/dialog/dialog.dart'
    as dialog;
import 'package:github_repository_search/src/utils/error/sunabako_exception.dart';

enum ErrorHandleType {
  dialogWithClose, //閉じるボタンのダイアログ表示
  dialogWithReloadAndCancel, //再読み込み、キャンセルボタンのダイアログ
  toast, //トースト表示
}

class MyAppError extends Error {
  final ErrorType type;
  final WidgetRef ref;

  MyAppError({
    required this.type,
    required this.ref,
  });

  /// エラーハンドリング
  Future<void> handle({
    required BuildContext context,
    VoidCallback? reload,
    VoidCallback? cancel,
    String? comeback,
  }) async {
    final String errMsg = ErrorTypeEx(type).errorMsg;
    final ErrorHandleType handleType = ErrorTypeEx(type).handleType;

    switch (handleType) {
      case ErrorHandleType.dialogWithClose:
        dialog.showErrorDialog(context, errMsg);
        break;
      case ErrorHandleType.dialogWithReloadAndCancel:
        dialog.showErrorDialogWithReloadAndCancel(
          context,
          errMsg,
          () {
            if (reload != null) {
              Navigator.pop(context);
              reload();
            }
          },
          () {
            if (cancel != null) {
              cancel();
            } else {
              Navigator.pop(context);
            }
          },
        );

        break;
      case ErrorHandleType.toast:
        //TODO: トースト表示
        break;
    }
  }
}
