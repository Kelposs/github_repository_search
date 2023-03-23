import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:github_repository_search/src/features/theme/domain/app_color.dart';

class AppStyle {
  final Color bg;
  final Color mainTextColor;
  final Color subText1;
  final Color subText2;
  final Color subText3;
  final Color subText4;
  final Color subText5;
  final Color disableColor;
  final Color hintText;
  final Color textFieldBgColor;
  final Color btnTextColor;
  final Color btnTextColor2;
  final Color btnColor;
  final Color disableBtn;
  final Color disableBtnTextColor;
  final Color toast;
  final Color appleIconColor;
  final Color appleBtnColor;
  final Color appleBtnText;
  final Color mailIconColor;
  final Color mailBtnColor;
  final Color mailBtnText;
  final Color disableCheckBoxColor;
  final Color primaryColor;
  final Color disableTabTextColor;
  final Color addIconDisableBgColor;
  final Color addIconDisableColor;
  final Color disableValueColor;

  final Color flatColor;

  AppStyle({
    required this.bg,
    required this.mainTextColor,
    required this.subText1,
    required this.subText2,
    required this.subText3,
    required this.subText4,
    required this.subText5,
    required this.disableColor,
    required this.hintText,
    required this.textFieldBgColor,
    required this.btnTextColor,
    required this.btnTextColor2,
    required this.btnColor,
    required this.disableBtn,
    required this.disableBtnTextColor,
    required this.toast,
    required this.appleIconColor,
    required this.appleBtnColor,
    required this.appleBtnText,
    required this.mailIconColor,
    required this.mailBtnColor,
    required this.mailBtnText,
    required this.disableCheckBoxColor,
    required this.primaryColor,
    required this.disableTabTextColor,
    required this.addIconDisableBgColor,
    required this.addIconDisableColor,
    required this.disableValueColor,
    required this.flatColor,
  });

  factory AppStyle.light({
    Color? bg,
    Color? mainTextColor,
    Color? textColor1,
    Color? textColor2,
    Color? textColor3,
    Color? textColor4,
    Color? textColor5,
    Color? disableColor,
    Color? hintText,
    Color? textFieldBgColor,
    Color? btnTextColor,
    Color? btnTextColor2,
    Color? btnColor,
    Color? disableBtn,
    Color? disabledBtnTextColor,
    Color? toast,
    Color? appleIconColor,
    Color? appleBtnColor,
    Color? appleBtnText,
    Color? mailIconColor,
    Color? mailBtnColor,
    Color? mailBtnText,
    Color? disableCheckBoxColor,
    Color? primaryColor,
    Color? disableTabTextColor,
    Color? addIconDisableBgColor,
    Color? addIconDisableColor,
    Color? disableValueColor,
    Color? flatColor,
    Color? linkColor,
  }) {
    return AppStyle(
      bg: bg ?? AppColor.lightBG,
      mainTextColor: mainTextColor ?? AppColor.black,
      subText1: textColor1 ?? AppColor.lightTextGrey1,
      subText2: textColor2 ?? AppColor.lightTextGrey2,
      subText3: textColor3 ?? AppColor.grayFA,
      subText4: textColor4 ?? AppColor.black,
      subText5: textColor5 ?? AppColor.grey98,
      disableColor: disableColor ?? AppColor.lightDisable,
      hintText: hintText ?? AppColor.lightTextGrey1,
      textFieldBgColor: textFieldBgColor ?? AppColor.lightTextFieldBg,
      btnTextColor: btnTextColor ?? AppColor.grayFA,
      btnTextColor2: btnTextColor2 ?? AppColor.lightBtnText,
      btnColor: btnColor ?? AppColor.lightBtnColor,
      disableBtn: disableBtn ?? AppColor.lightDisable,
      disableBtnTextColor: disabledBtnTextColor ?? AppColor.grayFA,
      toast: toast ?? AppColor.lightToast,
      appleIconColor: appleIconColor ?? Colors.white,
      appleBtnColor: appleBtnColor ?? Colors.black,
      appleBtnText: appleBtnText ?? AppColor.grayFA,
      mailIconColor: mailIconColor ?? AppColor.lightTextGrey2,
      mailBtnColor: mailBtnColor ?? AppColor.grayFA,
      mailBtnText: mailBtnText ?? AppColor.lightTextGrey2,
      disableCheckBoxColor: disableCheckBoxColor ?? AppColor.grayE2,
      primaryColor: primaryColor ?? AppColor.primaryColor,
      disableTabTextColor: disableTabTextColor ?? AppColor.greyCC,
      addIconDisableBgColor: addIconDisableBgColor ?? AppColor.grayF2,
      addIconDisableColor: addIconDisableColor ?? AppColor.greyCC,
      disableValueColor: disableValueColor ?? AppColor.grey98,
      flatColor: flatColor ?? AppColor.lightflatColor,
    );
  }

  factory AppStyle.dark({
    Color? bg,
    Color? mainTextColor,
    Color? textColor1,
    Color? textColor2,
    Color? textColor3,
    Color? textColor4,
    Color? textColor5,
    Color? disableColor,
    Color? hintText,
    Color? textFieldBgColor,
    Color? btnTextColor,
    Color? btnTextColor2,
    Color? btnColor,
    Color? disableBtn,
    Color? disableBtnTextColor,
    Color? toast,
    Color? appleIconColor,
    Color? appleBtnColor,
    Color? appleBtnText,
    Color? mailIconColor,
    Color? mailBtnColor,
    Color? mailBtnText,
    Color? disableCheckBoxColor,
    Color? primaryColor,
    Color? disableTabTextColor,
    Color? addIconDisableBgColor,
    Color? addIconDisableColor,
    Color? disableValueColor,
    Color? flatColor,
  }) {
    return AppStyle(
      bg: bg ?? AppColor.darkBG,
      mainTextColor: mainTextColor ?? AppColor.white,
      subText1: textColor1 ?? AppColor.darkTextGrey1,
      subText2: textColor2 ?? AppColor.darkTextGrey2,
      subText3: textColor3 ?? AppColor.grayFA,
      subText4: textColor4 ?? AppColor.darkTextGrey2,
      subText5: textColor5 ?? AppColor.darkDisable,
      disableColor: disableColor ?? AppColor.darkDisable,
      hintText: hintText ?? AppColor.darkTextGrey1,
      textFieldBgColor: textFieldBgColor ?? AppColor.darkTextFieldBg,
      btnTextColor: btnTextColor ?? AppColor.white,
      btnTextColor2: btnTextColor2 ?? AppColor.darkBtnText,
      btnColor: btnColor ?? AppColor.darkBtnColor,
      disableBtn: disableBtn ?? AppColor.darkDisable,
      disableBtnTextColor: disableBtnTextColor ?? AppColor.darkTextFieldBg,
      toast: toast ?? AppColor.darkToast,
      appleIconColor: appleIconColor ?? Colors.black,
      appleBtnColor: appleBtnColor ?? Colors.white,
      appleBtnText: appleBtnText ?? AppColor.black,
      mailIconColor: mailIconColor ?? AppColor.darkTextGrey2,
      mailBtnColor: mailBtnColor ?? AppColor.darkTextFieldBg,
      mailBtnText: mailBtnText ?? AppColor.white,
      disableCheckBoxColor: disableCheckBoxColor ?? AppColor.darkTextGrey2,
      primaryColor: primaryColor ?? AppColor.darkPrimaryColor2,
      disableTabTextColor: disableTabTextColor ?? AppColor.darkDisable,
      addIconDisableBgColor: addIconDisableBgColor ?? AppColor.darkGrey3,
      addIconDisableColor: addIconDisableColor ?? AppColor.darkIconDisable,
      disableValueColor: disableValueColor ?? AppColor.darkDisable,
      flatColor: flatColor ?? AppColor.darkflatColor,
    );
  }

  static EdgeInsets surveyPadding = EdgeInsets.only(
    left: 16.w,
    right: 16.w,
  );
}
