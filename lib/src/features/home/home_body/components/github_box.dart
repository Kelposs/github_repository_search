import 'package:flutter/material.dart';
import 'package:github_repository_search/gen/assets.gen.dart';
import 'package:github_repository_search/src/export_box.dart';

class GitHubBox extends ConsumerWidget {
  final Color backgroundColor;
  const GitHubBox({
    Key? key,
    required this.backgroundColor,
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
          Container(
            height: 70.h,
            child: Center(
              child: SvgPicture.asset(
                Assets.images.icon.iconGithubGrey.path,
                height: 35.h,
              ),
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: AppColor.white,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25.r),
                    bottomRight: Radius.circular(25.r)),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Lorem Ipsum",
                      style: Constants.kDefaultTextStyle.copyWith(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w600,
                          color: backgroundColor,
                          overflow: TextOverflow.ellipsis),
                    ),
                    Gap(5.h),
                    Text(
                      "Lorem Ipsum",
                      style: Constants.kDefaultTextStyle.copyWith(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold,
                          overflow: TextOverflow.ellipsis),
                    ),
                    Gap(8.h),
                    Text(
                      "Short Desription",
                      style: Constants.kDefaultTextStyle.copyWith(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.normal,
                          overflow: TextOverflow.ellipsis),
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
