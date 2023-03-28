import 'package:flutter/material.dart';
import 'package:github_repository_search/src/features/home/home_app_bar/presentation/home_app_bar.dart';
import 'package:github_repository_search/src/export_box.dart';
import 'package:github_repository_search/src/features/home/home_body/presentation/home_body.dart';
import 'package:github_repository_search/src/features/theme/data/theme_repository.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = ref.watch(themeRepoProvider).isDarkMode;

    return SafeArea(
      child: Scaffold(
        backgroundColor: isDark ? AppColor.black : AppColor.lightPrimaryColor,
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: const [
            HomeAppBar(),
            HomeBody(),
          ],
        ),
      ),
    );
  }
}
