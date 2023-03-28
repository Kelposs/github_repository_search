import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:github_repository_search/gen/assets.gen.dart';
import 'package:github_repository_search/src/features/home/home_app_bar/data/app_bar_text_controller.dart';
import 'package:github_repository_search/src/features/home/home_app_bar/data/home_app_bar_repository.dart';
import 'package:github_repository_search/src/export_box.dart';
import 'package:github_repository_search/src/features/theme/data/theme_repository.dart';

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
    final isDark = ref.watch(themeRepoProvider).isDarkMode;
    final wasTapped = ref.watch(appBarRepository).wasTapped;
    final searchRepository = ref.watch(textControllerRepository.notifier);

    return AnimatedContainer(
      height: wasTapped ? 90.h : bodyHeight,
      width: 375.w,
      curve: Curves.fastOutSlowIn,
      decoration: BoxDecoration(
        color: isDark ? AppColor.darkShadowColor : AppColor.white,
        borderRadius: wasTapped
            ? BorderRadius.only(
                bottomLeft: Radius.circular(15.r),
                bottomRight: Radius.circular(15.r),
              )
            : BorderRadius.circular(0.r),
      ),
      duration: const Duration(seconds: 1),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: changeWidget(isDark, wasTapped, searchRepository),
      ),
    );
  }

  Widget changeWidget(
    bool isDark,
    bool wasTapped,
    TextControllerRepository searchRepository,
  ) {
    Timer? debounce;

    return Stack(
      children: [
        AnimatedPositioned(
          top: wasTapped ? 30.h : bodyHeight / 3,
          left: wasTapped ? 0.w : 375.w / 3,
          duration: const Duration(seconds: 1),
          curve: Curves.fastOutSlowIn,
          child: SvgPicture.asset(
            isDark
                ? Assets.images.icon.iconGithubDark.path
                : Assets.images.icon.iconGithubLight.path,
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
              autofocus: false,
              controller: searchRepository.takeController(),
              onTap: () {
                ref.read(appBarRepository.notifier).makeTapped();
              },
              style: TextStyle(color: isDark ? AppColor.white : AppColor.black),
              decoration: InputDecoration(
                hintText: LocaleKeys.app_bar_title_hintText.tr(),
                hintStyle: TextStyle(
                  color:
                      isDark ? AppColor.darkTextGrey1 : AppColor.lightTextGrey1,
                ),
                filled: true,
                fillColor: isDark ? AppColor.black : AppColor.lightTextFieldBg,
                contentPadding: const EdgeInsets.all(15),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.r),
                  borderSide: BorderSide(
                    color: isDark ? AppColor.black : AppColor.lightTextFieldBg,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.r),
                  borderSide: BorderSide(
                    color: isDark ? AppColor.black : AppColor.lightTextFieldBg,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.r),
                  borderSide: BorderSide(
                    color: isDark ? AppColor.black : AppColor.lightTextFieldBg,
                  ),
                ),
              ),
              onChanged: (value) {
                if (debounce?.isActive ?? false) debounce!.cancel();
                debounce = Timer(const Duration(milliseconds: 500), () {
                  searchRepository.onChange(value.trim());
                });
              },
            ),
          ),
        ),
      ],
    );
  }
}
