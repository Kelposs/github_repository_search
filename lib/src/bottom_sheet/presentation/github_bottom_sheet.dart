import 'package:flutter/material.dart';
import 'package:github_repository_search/gen/assets.gen.dart';
import 'package:github_repository_search/src/export_box.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class GitHubBottomSheet {
  static show(
    BuildContext context,
    Color background,
  ) async {
    await showMaterialModalBottomSheet<int>(
      backgroundColor: AppColor.black,
      context: context,
      builder: (BuildContext context) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 200.h,
              decoration: BoxDecoration(
                color: background,
              ),
              child: Center(
                child: SvgPicture.asset(
                  Assets.images.icon.iconGithubGrey.path,
                  height: 75.h,
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: AppColor.white,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15.r),
                    bottomRight: Radius.circular(15.r)),
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: AppColor.white,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(25.r),
                      bottomRight: Radius.circular(25.r)),
                ),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Author name",
                        style: Constants.kDefaultTextStyle.copyWith(
                            fontSize: 22.sp,
                            fontWeight: FontWeight.w600,
                            color: background,
                            overflow: TextOverflow.ellipsis),
                      ),
                      Gap(10.h),
                      Text(
                        "Project Name",
                        style: Constants.kDefaultTextStyle.copyWith(
                            fontSize: 25.sp,
                            fontWeight: FontWeight.bold,
                            overflow: TextOverflow.ellipsis),
                      ),
                      Gap(15.h),
                      Text(
                        "Short Desription\nasdsa\nasaasdsadsadsadsadsad",
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: Constants.kDefaultTextStyle.copyWith(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.normal,
                            overflow: TextOverflow.ellipsis),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Gap(5.h),
            Expanded(
              child: ListView.builder(
                itemCount: 1,
                itemBuilder: (BuildContext context, int index) {
                  return _buildCarousel(context, index);
                },
              ),
            ),
          ],
        );
      },
    );
  }
}

Widget _buildCarousel(BuildContext context, int carouselIndex) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: <Widget>[
      SizedBox(
        height: 280.h,
        child: PageView.builder(
          itemCount: 5,
          controller: PageController(viewportFraction: 1),
          itemBuilder: (BuildContext context, int itemIndex) {
            return _buildCarouselItem(context, itemIndex);
          },
        ),
      )
    ],
  );
}

Widget _buildCarouselItem(BuildContext context, int itemIndex) {
  final List<String> temp = [
    Assets.images.icon.iconLanguageDark.path,
    Assets.images.icon.iconStarDark.path,
    Assets.images.icon.iconWatchersDark.path,
    Assets.images.icon.iconForkDark.path,
    Assets.images.icon.iconIssuesDark.path
  ];
  final List<String> temp2 = [
    "Language",
    "Stars",
    "Watchers",
    "Fork",
    "Issues"
  ];
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 8.w),
    child: Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(4.r),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            temp[itemIndex],
            height: 70.h,
          ),
          Gap(15.h),
          Text(
            temp2[itemIndex] + "：" + "1234",
            style: Constants.kDefaultTextStyle
                .copyWith(fontSize: 30.sp, fontWeight: FontWeight.bold),
          )
        ],
      ),
    ),
  );
}
