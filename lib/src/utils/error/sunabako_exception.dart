import 'package:flutter/material.dart';
import 'package:github_repository_search/app.dart';

import 'package:github_repository_search/src/export_box.dart';
import 'package:github_repository_search/src/utils/dialog/dialog.dart';
import 'package:github_repository_search/src/utils/error/sunabako_error.dart';

/// エラー種別
enum ErrorType {
  //System Error
  offline, //通信エラー
  apiFailure, //APIによる通信エラー
  validation, //メンテナンス中エラー
  ignore, //エラー表示しない
  undefined, //想定外のエラー
  exceeded, //APIコールの上限を超えた
}

extension ErrorTypeEx on ErrorType {
  /// エラーメッセージ
  static final errorMessages = {
    //System Error
    ErrorType.offline: LocaleKeys.errors_offline.tr(),
    ErrorType.apiFailure: LocaleKeys.errors_service_unavailable.tr(),
    ErrorType.validation: LocaleKeys.errors_validation_failed.tr(),
    ErrorType.ignore: '',
    ErrorType.undefined: LocaleKeys.errors_undefined.tr(),
    ErrorType.exceeded: LocaleKeys.errors_exceed.tr(),
  };

  static final handleTypes = {
    //System Error
    ErrorType.offline: ErrorHandleType.dialogWithReloadAndCancel,
    ErrorType.exceeded: ErrorHandleType.dialogWithReloadAndCancel,
    ErrorType.apiFailure: ErrorHandleType.dialogWithClose,
    ErrorType.validation: ErrorHandleType.dialogWithClose,
    ErrorType.undefined: ErrorHandleType.dialogWithClose,
    ErrorType.ignore: ErrorHandleType.toast,
  };

  String get errorTitle => '';

  String get errorMsg => errorMessages[this]!;

  ErrorHandleType get handleType => handleTypes[this]!;
}

class MyAppException implements Exception {
  String cause;

  MyAppException(this.cause);

  ErrorType get type => causeToEnum(cause);

  ErrorType causeToEnum(String code) {
    return codeErrorTypeMaps[code] ?? ErrorType.undefined;
  }

  final codeErrorTypeMaps = {
    '1001': ErrorType.offline,
    '503': ErrorType.apiFailure,
    '422': ErrorType.validation,
    '403': ErrorType.exceeded,
    '9000': ErrorType.ignore,
    '9999': ErrorType.undefined,
  };

  Future<void> handle(
    VoidCallback? onPressed,
  ) async {
    showErrorDialogWithReload(
      navigatorKey.currentState!.context,
      causeToEnum(cause).errorMsg,
      onPressed: () {
        Navigator.pop(navigatorKey.currentState!.context);

        if (onPressed != null) {
          onPressed();
        }
      },
    );
  }
}

class AppException implements Exception {
  AppException({
    required this.code,
    required this.message,
    this.operationName,
    this.networkStatusCode,
    this.ignore = false,
    this.toast = false,
  });

  final bool ignore;
  final bool toast;

  final String code;
  final String? message;
  final int? networkStatusCode;
  final String? operationName;

  factory AppException.apiError(String code, String message,
      {String? operationName}) {
    return AppException(
      code: code,
      message: message,
      operationName: operationName,
    );
  }

  factory AppException.undefine(String message, {String? operationName}) {
    return AppException(
      code: '9999',
      message: message,
      operationName: operationName,
    );
  }

  factory AppException.ignore(String message, {String? operationName}) {
    return AppException(
      code: '9999',
      message: message,
      ignore: true,
      operationName: operationName,
    );
  }

  factory AppException.toast(String message, {String? operationName}) {
    return AppException(
      code: '9000',
      message: message,
      toast: true,
      operationName: operationName,
    );
  }

  String get dialogMessage {
    return '$message';
  }

  Future<void> handle(BuildContext context) async {
    if (ignore || toast) {
      return;
    }

    showErrorDialog(
      context,
      dialogMessage,
    );
  }
}
