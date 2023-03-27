import 'package:flutter/material.dart';
import 'package:github_repository_search/src/bottom_sheet/data/model/enum/github_information_type.dart';
import 'package:github_repository_search/src/export_box.dart';
import 'package:github_repository_search/src/features/github/data/domain/github_tile.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class GitHubBottomSheet {
  static show(BuildContext context, Color background, GitHubTile tile) async {
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
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(45.0),
                  child: Image.network(
                    tile.avatarUrl,
                    height: 75.h,
                  ),
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
                        tile.author,
                        style: Constants.kDefaultTextStyle.copyWith(
                            fontSize: 22.sp,
                            fontWeight: FontWeight.w600,
                            color: background,
                            overflow: TextOverflow.ellipsis),
                      ),
                      Gap(10.h),
                      Text(
                        tile.name,
                        style: Constants.kDefaultTextStyle.copyWith(
                            fontSize: 25.sp,
                            fontWeight: FontWeight.bold,
                            overflow: TextOverflow.ellipsis),
                      ),
                      Gap(15.h),
                      Text(
                        tile.description,
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
                  return _buildCarousel(context, index, tile);
                },
              ),
            ),
          ],
        );
      },
    );
  }
}

Widget _buildCarousel(
    BuildContext context, int carouselIndex, GitHubTile tile) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: <Widget>[
      SizedBox(
        height: 280.h,
        child: PageView.builder(
          itemCount: InformationType.values.length,
          controller: PageController(viewportFraction: 1),
          itemBuilder: (BuildContext context, int itemIndex) {
            return _buildCarouselItem(context, itemIndex, tile);
          },
        ),
      )
    ],
  );
}

Widget _buildCarouselItem(
    BuildContext context, int itemIndex, GitHubTile tile) {
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
            InformationType.values[itemIndex].informationType.keys.first,
            height: 70.h,
          ),
          Gap(15.h),
          Text(
            "${InformationType.values[itemIndex].informationType.values.first}：${(() {
              switch (InformationType.values[itemIndex]) {
                case InformationType.language:
                  return tile.language;
                case InformationType.stars:
                  return tile.starCount.toString();
                case InformationType.forks:
                  return tile.forks.toString();
                case InformationType.issues:
                  return tile.issues.toString();
                case InformationType.watchers:
                  return tile.watchers.toString();
              }
            })()}",
            style: Constants.kDefaultTextStyle
                .copyWith(fontSize: 30.sp, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    ),
  );
}
