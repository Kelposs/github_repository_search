import 'package:flutter/material.dart';
import 'package:github_repository_search/src/export_box.dart';
import 'package:github_repository_search/src/features/home/home_body/components/github_box.dart';

class HomeBody extends ConsumerStatefulWidget {
  const HomeBody({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeBodyState();
}

class _HomeBodyState extends ConsumerState<HomeBody> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: GridView.count(
          physics: const ScrollPhysics(),
          crossAxisCount: 2,
          scrollDirection: Axis.vertical,
          mainAxisSpacing: 16.h,
          crossAxisSpacing: 14.w,
          padding: EdgeInsets.only(top: 20.h),
          shrinkWrap: true,
          children: List.generate(10, (index) {
            final backgroundColor = AppColor.containerColorsList[
                index % AppColor.containerColorsList.length];
            //height 147.h
            return GestureDetector(
              onTap: () {},
              child: GitHubBox(
                backgroundColor: backgroundColor,
              ),
            );
          }),
        ),
      ),
    );
  }
}
