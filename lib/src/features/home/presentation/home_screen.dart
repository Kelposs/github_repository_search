import 'package:flutter/material.dart';
import 'package:github_repository_search/src/features/home/home_app_bar/data/home_app_bar_repository.dart';
import 'package:github_repository_search/src/features/home/home_app_bar/presentation/home_app_bar.dart';
import 'package:github_repository_search/src/export_box.dart';
import 'package:github_repository_search/src/features/home/home_body/presentation/home_body.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final wasTapped = ref.watch(appBarRepository).wasTapped;

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.black,
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            HomeAppBar(),
            HomeBody(),
          ],
        ),
      ),
    );
  }
}
