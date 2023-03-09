import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'palette.dart';

abstract class AppStyles {
  const AppStyles._();

  static bool deviceTablet = SizerUtil.deviceType == DeviceType.tablet;

  static const montserratRegularFontFamily = "Montserrat";
  static const hindMaduraiRegularFontFamily = "Hind Madurai";

  static final blackHeadlineColor20spw700MontserratLineHeight = TextStyle(
    color: AppPalette.blackHeadlineColor,
    fontSize: 20.sp,
    height: 1.5,
    fontWeight: FontWeight.bold,
    fontFamily: montserratRegularFontFamily,
  );

  static final blackHeadlineColor16spw700Montserrat = TextStyle(
    color: AppPalette.blackHeadlineColor,
    fontSize: 16.sp,
    fontWeight: FontWeight.bold,
    fontFamily: montserratRegularFontFamily,
  );

  static final blackHeadlineColor20spw700MontserratLetterSpacing = TextStyle(
    color: AppPalette.blackHeadlineColor,
    fontSize: 20.sp,
    letterSpacing: 1.5,
    fontWeight: FontWeight.bold,
    fontFamily: montserratRegularFontFamily,
  );
  static final blackHeadlineColor14spw700Montserrat = TextStyle(
    color: AppPalette.blackHeadlineColor,
    fontSize: 14.sp,
    fontWeight: FontWeight.bold,
    fontFamily: montserratRegularFontFamily,
  );

  static final blackHeadlineColor13spw700Montserrat = TextStyle(
    color: AppPalette.blackHeadlineColor,
    fontSize: 13.sp,
    fontWeight: FontWeight.bold,
    fontFamily: montserratRegularFontFamily,
  );

  static final blackHeadlineColor10spw500Montserrat = TextStyle(
    color: AppPalette.blackHeadlineColor,
    fontSize: 10.sp,
    fontWeight: FontWeight.w500,
    fontFamily: montserratRegularFontFamily,
  );

  static final errorSnackbarTextStyle = TextStyle(
    color: AppPalette.whiteColor,
    fontSize: 10.sp,
    height: 1.3,
    fontFamily: montserratRegularFontFamily,
    fontWeight: FontWeight.bold,
  );

  static final mainBlueColor14spw700Montserrat1 = TextStyle(
    color: AppPalette.mainBlueColor,
    fontSize: 14.sp,
    fontWeight: FontWeight.bold,
    fontFamily: montserratRegularFontFamily,
  );

  static final mainBlueColor16spw700Montserrat = TextStyle(
    color: AppPalette.mainBlueColor,
    fontSize: 16.sp,
    fontWeight: FontWeight.bold,
    fontFamily: montserratRegularFontFamily,
  );

  static final mainBlueColor14spw700Montserrat = TextStyle(
    color: AppPalette.mainBlueColor,
    fontSize: 14.sp,
    fontWeight: FontWeight.bold,
    fontFamily: montserratRegularFontFamily,
  );

  static final mainOrangeColor20spw700Montserrat = TextStyle(
    color: AppPalette.mainOrangeColor,
    fontSize: 20.sp,
    fontWeight: FontWeight.bold,
    fontFamily: montserratRegularFontFamily,
  );

  static final greyHeadlineColor12spw500MontserratLineHeight = TextStyle(
    color: AppPalette.greyHeadlineColor,
    fontSize: 12.sp,
    height: 1.5,
    fontWeight: FontWeight.w500,
    fontFamily: montserratRegularFontFamily,
  );
  static final thirdGreyColor12spw500Montserrat = TextStyle(
    color: AppPalette.thirdGreyColor,
    fontSize: 12.sp,
    fontWeight: FontWeight.w500,
    fontFamily: montserratRegularFontFamily,
  );

  static final mainOrangeColor14spw700Montserrat = TextStyle(
    color: AppPalette.mainOrangeColor,
    fontSize: 14.sp,
    fontWeight: FontWeight.bold,
    fontFamily: montserratRegularFontFamily,
  );

  static final whiteColor14spw500HindMadurai = TextStyle(
    color: AppPalette.whiteColor,
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    fontFamily: hindMaduraiRegularFontFamily,
  );

  static final whiteColor14spw700Montserrat = TextStyle(
    color: AppPalette.whiteColor,
    fontSize: 14.sp,
    fontWeight: FontWeight.bold,
    fontFamily: montserratRegularFontFamily,
  );

  static final whiteColor28spw700Montserrat = TextStyle(
    color: AppPalette.whiteColor,
    fontSize: 28.sp,
    fontWeight: FontWeight.bold,
    fontFamily: montserratRegularFontFamily,
  );

  static final whiteColor12spw600Montserrat = TextStyle(
    color: AppPalette.whiteColor,
    fontSize: 12.sp,
    fontWeight: FontWeight.w600,
    fontFamily: montserratRegularFontFamily,
  );

  static final whiteColor24spw700Montserrat = TextStyle(
    color: AppPalette.whiteColor,
    fontSize: 24.sp,
    fontWeight: FontWeight.bold,
    fontFamily: montserratRegularFontFamily,
  );

  static final whiteColor18spw700Montserrat = TextStyle(
    color: AppPalette.whiteColor,
    fontSize: 18.sp,
    fontWeight: FontWeight.bold,
    fontFamily: montserratRegularFontFamily,
  );

  static final secondaryGreyColor14spw500Montserrat = TextStyle(
    fontFamily: montserratRegularFontFamily,
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    color: AppPalette.secondaryGreyColor,
  );

  static final secondaryGreyColor10spw600Montserrat = TextStyle(
    color: AppPalette.secondaryGreyColor,
    fontSize: 10.sp,
    fontWeight: FontWeight.w600,
    fontFamily: montserratRegularFontFamily,
  );

  static const modalBottomSheetShapeDecorationStyle = RoundedRectangleBorder(
    borderRadius: BorderRadius.only(
        topLeft: Radius.circular(30), topRight: Radius.circular(30)),
  );

  static const numericKeyboardDarkGrayBorderSideStyle =
      BorderSide(color: AppPalette.darkGrayColor, width: 2.5);
}
