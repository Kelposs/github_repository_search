import 'package:flutter/material.dart';
import 'package:github_repository_search/src/export_box.dart';
import 'package:github_repository_search/src/features/github/data/domain/github_tile.dart';

class GitHubBox extends ConsumerWidget {
  final bool isDark;
  final Color backgroundColor;
  final GitHubTile tile;
  const GitHubBox({
    Key? key,
    required this.isDark,
    required this.backgroundColor,
    required this.tile,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: 147.h,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(25.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 70.h,
            child: Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30.0),
                child: Image.network(
                  tile.avatarUrl,
                  height: 35.h,
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: AppColor.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25.r),
                  bottomRight: Radius.circular(25.r),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      tile.author,
                      style: Constants.kDefaultTextStyle.copyWith(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w600,
                        color: backgroundColor,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Gap(5.h),
                    Text(
                      tile.name,
                      style: Constants.kDefaultTextStyle.copyWith(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColor.black,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Gap(4.h),
                    Text(
                      tile.description,
                      style: Constants.kDefaultTextStyle.copyWith(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.normal,
                        color: AppColor.black,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
