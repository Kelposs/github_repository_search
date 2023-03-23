import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import "package:github_repository_search/src/export_box.dart";

final systemBrightnessProvider = StateNotifierProvider.autoDispose
    .family<SystemBrightnessNotifier, Brightness, ThemeMode>(
  (ref, themeMode) => SystemBrightnessNotifier(themeMode),
);

class SystemBrightnessNotifier extends StateNotifier<Brightness>
    with WidgetsBindingObserver {
  SystemBrightnessNotifier(this.themeMode) : super(Brightness.light) {
    _setup();
    _addListener();
  }

  final ThemeMode themeMode;

  void _setup() {
    updateBrightness();
  }

  void _addListener() {
    WidgetsBinding.instance.addObserver(this);

    // This callback is called every time the brightness changes.
    WidgetsBinding.instance.window.onPlatformBrightnessChanged = () {
      WidgetsBinding.instance.handlePlatformBrightnessChanged();

      logger.i(
        'onPlatformBrightnessChanged: ${WidgetsBinding.instance.window.platformBrightness}',
      );

      if (!mounted) {
        return;
      }

      updateBrightness();
    };
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  void updateBrightness() {
    if (!mounted) {
      return;
    }

    if (!themeMode.isAuto) {
      return;
    }

    final systemBrightness =
        SchedulerBinding.instance.window.platformBrightness;

    if (state == systemBrightness) {
      return;
    }

    state = systemBrightness;
  }
}
