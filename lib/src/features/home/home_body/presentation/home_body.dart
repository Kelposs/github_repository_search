import 'package:flutter/material.dart';
import 'package:github_repository_search/src/bottom_sheet/presentation/github_bottom_sheet.dart';
import 'package:github_repository_search/src/export_box.dart';
import 'package:github_repository_search/src/features/home/home_app_bar/data/app_bar_text_controller.dart';
import 'package:github_repository_search/src/features/home/home_body/components/github_box.dart';
import 'package:github_repository_search/src/features/home/home_body/data/home_body_provider.dart';

class HomeBody extends ConsumerStatefulWidget {
  const HomeBody({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeBodyState();
}

class _HomeBodyState extends ConsumerState<HomeBody> {
  @override
  Widget build(BuildContext context) {
    final textController = ref.watch(textControllerRepository);

    if (textController.text.isEmpty) return Container();
    final gitHubRepository = ref.watch(homeBodyProvider);
    return gitHubRepository.when(
      loading: () =>
          const Expanded(child: Center(child: CircularProgressIndicator())),
      error: (error, stackTrace) => Text(error.toString()),
      data: (githubTiles) {
        return Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: GridView.count(
              physics: const ScrollPhysics(),
              crossAxisCount: 2,
              scrollDirection: Axis.vertical,
              mainAxisSpacing: 16.h,
              crossAxisSpacing: 14.w,
              padding: EdgeInsets.symmetric(vertical: 20.h),
              shrinkWrap: true,
              children: List.generate(githubTiles.length, (index) {
                final backgroundColor = AppColor.containerColorsList[
                    index % AppColor.containerColorsList.length];
                //height 147.h
                return GestureDetector(
                  onTap: () {
                    GitHubBottomSheet.show(
                        context, backgroundColor, githubTiles[index]);
                  },
                  child: GitHubBox(
                    backgroundColor: backgroundColor,
                    tile: githubTiles[index],
                  ),
                );
              }),
            ),
          ),
        );
      },
    );
  }
}
