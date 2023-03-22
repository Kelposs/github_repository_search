import 'dart:io';
import 'package:flutter/material.dart';
import 'package:github_repository_search/src/utils/dialog/dialog.dart';

class WillQuitAppScope extends StatelessWidget {
  const WillQuitAppScope({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return child;
    }

    return WillPopScope(
      onWillPop: () => _onWillPop(context),
      child: child,
    );
  }

  Future<bool> _onWillPop(BuildContext context) async {
    if (Navigator.of(context).canPop()) {
      return Future.value(true);
    }

    return showQuitAppDialog(context);
  }
}
