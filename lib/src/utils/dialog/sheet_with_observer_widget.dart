import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final isShowBottomSheet = StateProvider<bool>((ref) => false);

class SheetWithObserverWidget extends ConsumerStatefulWidget {
  const SheetWithObserverWidget({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  _SheetWithObserverWidgetState createState() =>
      _SheetWithObserverWidgetState();
}

class _SheetWithObserverWidgetState
    extends ConsumerState<SheetWithObserverWidget> with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    if (state == AppLifecycleState.paused) {
      Navigator.pop(context);
    }

    if (Platform.isIOS && state == AppLifecycleState.inactive) {
      // 通知センターやコントロールセンターはpausedを介さない
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
