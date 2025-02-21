import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rentpro/app/widgets/constants.dart';

class AcnooTheme {
  static final lightTheme = ThemeData(
    //Typography
    fontFamily: 'Lato',

    //Appereance
    scaffoldBackgroundColor: AcnooAppColors.kScaffoldBackground,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      iconTheme: IconThemeData(color: AcnooAppColors.kNeutralColor900),
      titleTextStyle: TextStyle(
          color: AcnooAppColors.kNeutralColor900,
          fontFamily: 'Lato',
          fontSize: 18.sp,
          fontWeight: FontWeight.w500),
    ),

    // floatingActionButtonTheme: FloatingActionButtonThemeData(
    //     backgroundColor: AcnooAppColors.kPrimary,
    //     foregroundColor: AcnooAppColors.kWhite),
    // textButtonTheme: TextButtonThemeData(
    //     style: ButtonStyle(
    //         textStyle: MaterialStateProperty.all(
    //             TextStyle(fontFamily: 'ManRope', fontSize: 20)),
    //         overlayColor: MaterialStateProperty.all(
    //             AcnooAppColors.kPrimary.withOpacity(0.1)))),
    // //Icon Data
    // iconTheme: IconThemeData(size: 24.sp),
    // iconButtonTheme: IconButtonThemeData(
    //     style: ButtonStyle(iconSize: MaterialStateProperty.all(24.sp))),

    //Text field theme
    inputDecorationTheme: InputDecorationTheme(
        floatingLabelBehavior: FloatingLabelBehavior.always,
        hintStyle: AcnooTextStyle.kBodySm
            .copyWith(color: AcnooAppColors.kNeutralColor400),
        floatingLabelStyle: AcnooTextStyle.kBodySm
            .copyWith(color: AcnooAppColors.kNeutralColor900),
        isDense: true,
        labelStyle: AcnooTextStyle.kBodySm
            .copyWith(color: AcnooAppColors.kNeutralColor900),

        //Enabled Border
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(6.r)),
            borderSide:
                BorderSide(color: AcnooAppColors.kNeutralColor200, width: 1.w)),

        //Disabled Border
        disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(6.r)),
            borderSide:
                BorderSide(color: AcnooAppColors.kNeutralColor200, width: 1.w)),

        //Focus Border
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(6.r),
            ),
            borderSide:
                BorderSide(color: AcnooAppColors.kNeutralColor800, width: 1.w)),

        //Error Border
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(6.r),
            ),
            borderSide:
                BorderSide(color: AcnooAppColors.kWarningHover, width: 1.w)),

        //Error Focus Border
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(6.r),
            ),
            borderSide:
                BorderSide(color: AcnooAppColors.kWarningHover, width: 1.w)),

        //Suffix Icon Color
        suffixIconColor: AcnooAppColors.kNeutralColor400),

    // //Bottom Navigation theme
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AcnooAppColors.kScaffoldBackground,
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: AcnooAppColors.kPrimaryColor700,
      unselectedItemColor: AcnooAppColors.kNeutralColor500,
    ),
    radioTheme: RadioThemeData(
        fillColor: MaterialStatePropertyAll(AcnooAppColors.kPrimaryColor700)),
    checkboxTheme: CheckboxThemeData(
      shape: RoundedRectangleBorder(
        side: BorderSide(color: AcnooAppColors.kNeutralColor400),
        borderRadius: BorderRadius.circular(4),
      ),
      side: BorderSide(color: AcnooAppColors.kNeutralColor400),
      checkColor: MaterialStatePropertyAll(AcnooAppColors.kWhite),
      fillColor: MaterialStatePropertyAll(AcnooAppColors.kPrimaryColor700),
    ),
  );
}
