import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:github_repository_search/gen/assets.gen.dart';
import 'package:github_repository_search/src/features/home/home_app_bar/data/home_app_bar_repository.dart';
import 'package:github_repository_search/src/export_box.dart';

class HomeAppBar extends ConsumerStatefulWidget {
  const HomeAppBar({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeAppBarState();
}

class _HomeAppBarState extends ConsumerState<HomeAppBar> {
  final double bodyHeight =
      667.h - MediaQueryData.fromWindow(window).padding.top;
  @override
  Widget build(BuildContext context) {
    final wasTapped = ref.watch(appBarRepository).wasTapped;

    return AnimatedContainer(
        height: wasTapped ? 90.h : bodyHeight,
        width: 375.w,
        curve: Curves.fastOutSlowIn,
        decoration: BoxDecoration(
          color: AppColor.darkShadowColor,
          borderRadius: wasTapped
              ? BorderRadius.only(
                  bottomLeft: Radius.circular(15.r),
                  bottomRight: Radius.circular(15.r))
              : BorderRadius.circular(0.r),
        ),
        duration: const Duration(seconds: 1),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: changeWidget(wasTapped),
        ));
  }

  Widget changeWidget(bool wasTapped) {
    return Stack(
      children: [
        AnimatedPositioned(
          top: wasTapped ? 30.h : bodyHeight / 3,
          left: wasTapped ? 0.w : 375.w / 3,
          duration: const Duration(seconds: 1),
          curve: Curves.fastOutSlowIn,
          child: SvgPicture.asset(
            Assets.images.icon.iconGithubDark.path,
            height: wasTapped ? 40.h : 80.h,
          ),
        ),
        AnimatedPositioned(
          top: wasTapped ? 30.h : bodyHeight / 3 + 80.h + 20.h,
          left: wasTapped ? 55.w : 0.h,
          duration: const Duration(milliseconds: 700),
          child: SizedBox(
            width: wasTapped ? 288.w : 375.w - 32.w,
            child: TextField(
              onTap: () {
                ref.read(appBarRepository.notifier).makeTapped();
              },
              style: TextStyle(color: AppColor.white),
              decoration: InputDecoration(
                hintText: LocaleKeys.app_bar_title_hintText.tr(),
                hintStyle: TextStyle(color: AppColor.darkTextGrey1),
                filled: true,
                fillColor: AppColor.black,
                contentPadding: const EdgeInsets.all(15),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.r),
                    borderSide: const BorderSide(color: AppColor.black)),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.r),
                  borderSide: const BorderSide(color: AppColor.black),
                ),
              ),
              onChanged: (value) {
                // do something
              },
            ),
          ),
        ),
      ],
    );
  }
}
