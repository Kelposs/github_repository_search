import 'package:flutter/material.dart';
import 'package:github_repository_search/src/features/home/home_app_bar/presentation/home_app_bar.dart';
import 'package:github_repository_search/src/export_box.dart';
import 'package:github_repository_search/src/features/home/home_body/presentation/home_body.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.black,
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
