import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:palette_generator/palette_generator.dart';

import '../modules/authentication/onboarding/data/onboard_data.dart';

class AcnooAppColors {
  //---------App Colors----------//
  static const kPrimaryColor50 = Color(0xffEFF8FF);
  static const kPrimaryColor100 = Color(0xffD1E9FF);
  static const kPrimaryColor200 = Color(0xffB2DDFF);
  static const kPrimaryColor300 = Color(0xff84CAFF);
  static const kPrimaryColor400 = Color(0xff53B1FD);
  static const kPrimaryColor500 = Color(0xff2E90FA);
  static const kPrimaryColor600 = Color(0xff1570EF);
  static const kPrimaryColor700 = Color(0xff6200EA);
  static const kPrimaryColor800 = Color(0xff1849A9);
  static const kPrimaryColor900 = Color(0xff194185);

  static const kSecondaryColor50 = Color(0xffFFF4ED);
  static const kSecondaryColor100 = Color(0xffFFE6D5);
  static const kSecondaryColor200 = Color(0xffFFD6AE);
  static const kSecondaryColor300 = Color(0xffFF9C66);
  static const kSecondaryColor400 = Color(0xffFF692E);
  static const kSecondaryColor500 = Color(0xffFF4405);
  static const kSecondaryColor600 = Color(0xffE62E05);
  static const kSecondaryColor700 = Color(0xffBC1B06);
  static const kSecondaryColor800 = Color(0xff97180C);
  static const kSecondaryColor900 = Color(0xff771A0D);

  static const kNeutralColor50 = Color(0xffD9D9D9);
  static const kNeutralColor100 = Color(0xffFAFBFD);
  static const kNeutralColor200 = Color(0xffEAECF0);
  static const kNeutralColor300 = Color(0xffD0D5DD);
  static const kNeutralColor400 = Color(0xff98A2B3);
  static const kNeutralColor500 = Color(0xff667085);
  static const kNeutralColor600 = Color(0xff475467);
  static const kNeutralColor700 = Color(0xff344054);
  static const kNeutralColor800 = Color(0xff1D2939);
  static const kNeutralColor900 = Color(0xff101828);

  static const kSuccessMain = Color(0xff00BF71);
  static const kSuccessSurface = Color(0xffCCF2E3);
  static const kSuccessBorder = Color(0xffAAEAD0);
  static const kSuccessHover = Color(0xff009F5E);
  static const kSuccessPressed = Color(0xff006038);
  static final kSuccessFocus = const Color(0xff00BF71).withOpacity(0.20);

  static const kInfoMain = Color(0xff0C61F7);
  static const kInfoSurface = Color(0xffCEDFFD);
  static const kInfoBorder = Color(0xffAECAFC);
  static const kInfoHover = Color(0xff0A51CE);
  static const kInfoPressed = Color(0xff06307C);
  static final kInfoFocus = const Color(0xff0C61F7).withOpacity(0.20);

  static const kWarningMain = Color(0xffF2C94C);
  static const kWarningSurface = Color(0xffFCF4DB);
  static const kWarningBorder = Color(0xffFBEDC3);
  static const kWarningHover = Color(0xffCAA73F);
  static const kWarningPressed = Color(0xff796426);
  static final kWarningFocus = const Color(0xffF2C94C).withOpacity(0.20);

  static const kDangerMain = Color(0xffFF3B30);
  static const kDangerSurface = Color(0xffFFD8D6);
  static const kDangerBorder = Color(0xffFFBEBA);
  static const kDangerHover = Color(0xffD53128);
  static const kDangerPressed = Color(0xff801D18);
  static final kDangerFocus = const Color(0xffFF3B30).withOpacity(0.20);

  //----------Other Colors---------//
  static const kWhite = Color(0xffffffff);
  static const kScaffoldBackground = Color(0xffF0EDFE);
  static const kRatingStarColor = Color(0xffFFB03A);
}

//Acnoo Text Styles
class AcnooTextStyle {
  static final kHeading1 = TextStyle(
      fontFamily: 'Lato', fontSize: 30.sp, fontWeight: FontWeight.w700);
  static final kHeading2 = TextStyle(
      fontFamily: 'Lato', fontSize: 24.sp, fontWeight: FontWeight.bold);
  static final kHeading3 = TextStyle(
      fontFamily: 'Lato', fontSize: 20.sp, fontWeight: FontWeight.w700);

  static final kBodyLg = TextStyle(fontFamily: 'Lato', fontSize: 18.sp);

  static final kBodyMd = TextStyle(fontFamily: 'Lato', fontSize: 16.sp);

  static final kBodySm = TextStyle(fontFamily: 'Lato', fontSize: 14.sp);
  static final kCaption = TextStyle(fontFamily: 'Lato', fontSize: 12.sp);
}

//Acnoo Button Styles
class AcnooButtonStyle {
  static final kPrimaryTextButton = ButtonStyle(
    textStyle: MaterialStateProperty.all(TextStyle(
        fontFamily: 'Lato', fontSize: 16.sp, fontWeight: FontWeight.bold)),
    minimumSize: MaterialStateProperty.all(Size(366.w, 54.h)),
    backgroundColor: MaterialStateProperty.all(AcnooAppColors.kPrimaryColor700),
    foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
    shape: MaterialStateProperty.all(RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(6),
    )),
  );
  static final kSecondaryButton = ButtonStyle(
      textStyle: MaterialStateProperty.all(TextStyle(
          fontFamily: 'Lato', fontSize: 16.sp, fontWeight: FontWeight.bold)),
      foregroundColor:
          MaterialStateProperty.all(AcnooAppColors.kPrimaryColor700),
      minimumSize: MaterialStateProperty.all(Size(366.w, 54.h)),
      shape: MaterialStateProperty.all(RoundedRectangleBorder(
          side:
              BorderSide(color: AcnooAppColors.kPrimaryColor700, width: 1.5.w),
          borderRadius: BorderRadius.circular(6))));

  static final kTertiaryButton = ButtonStyle(
    textStyle: MaterialStateProperty.all(
        TextStyle(fontFamily: 'Lato', fontSize: 16.sp)),
    minimumSize: MaterialStateProperty.all(Size(366.w, 54.h)),
    backgroundColor:
        MaterialStateProperty.all(AcnooAppColors.kDangerHover.withOpacity(0.1)),
    foregroundColor:
        MaterialStateProperty.all<Color>(AcnooAppColors.kDangerHover),
    shape: MaterialStateProperty.all(RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(6),
    )),
  );
}

//For Scaffold Toast delay
DateTime? _lastSnackbarTime;

class AcnooCommonUtils {
//Number format
  static String formatNumberWithCommas(var value) {
    final formatter = NumberFormat('#,###');
    return formatter.format(value);
  }

  //--------To get the onboarding image dominator colors--------///
  static List<Color> containerColors = [Colors.transparent];
  static Future<void> getColors() async {
    containerColors.clear();

    for (int i = 0; i < AcnooOnboardItems.onboardItems.length; i++) {
      final category = AcnooOnboardItems.onboardItems[i];
      final PaletteGenerator generator =
          await PaletteGenerator.fromImageProvider(
        AssetImage(category.imageUrl),
      );

      containerColors.add(generator.dominantColor?.color ?? Colors.transparent);
    }
  }

  //Scaffold Toast
  static void showScaffoldToast(
      {required BuildContext context,
      required String message,
      SnackBarAction? action}) {
    final scaffold = ScaffoldMessenger.of(context);

    // Check if the snackbar was shown within the last 3 seconds
    final now = DateTime.now();
    if (_lastSnackbarTime != null &&
        now.difference(_lastSnackbarTime!) < const Duration(seconds: 3)) {
      return;
    }

    scaffold.showSnackBar(
      SnackBar(
        backgroundColor: AcnooAppColors.kPrimaryColor700,
        duration: const Duration(milliseconds: 2000),
        content: Text(
          message,
          style: AcnooTextStyle.kBodyLg.copyWith(
            color: AcnooAppColors.kWhite,
            fontWeight: FontWeight.w500,
          ),
        ),
        action: action,
      ),
    );

    // Update the last snackbar time
    _lastSnackbarTime = now;
  }
}

class AcnooInputDecoration {
  static final InputDecoration kInputDecoration = InputDecoration(
      floatingLabelBehavior: FloatingLabelBehavior.always,
      hintStyle: AcnooTextStyle.kBodySm,
      floatingLabelStyle: AcnooTextStyle.kBodySm,
      isDense: true,
      labelStyle: AcnooTextStyle.kBodySm,

      //Enabled Border
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0.r)),
          borderSide:
              BorderSide(color: AcnooAppColors.kNeutralColor200, width: 1.w)),

      //Focus Border
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10.0.r),
          ),
          borderSide:
              BorderSide(color: AcnooAppColors.kNeutralColor800, width: 1.w)),

      //Error Border
      errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10.0.r),
          ),
          borderSide:
              BorderSide(color: AcnooAppColors.kDangerHover, width: 1.w)),

      //Error Focus Border
      focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10.0.r),
          ),
          borderSide:
              BorderSide(color: AcnooAppColors.kDangerHover, width: 1.w)),

      //Suffix Icon Color
      suffixIconColor: AcnooAppColors.kNeutralColor400);

  static final InputDecoration kDisabledInputDecoration = InputDecoration(
      floatingLabelBehavior: FloatingLabelBehavior.always,
      hintStyle: AcnooTextStyle.kBodySm,
      floatingLabelStyle: AcnooTextStyle.kBodySm,
      isDense: true,
      labelStyle: AcnooTextStyle.kBodySm,
      filled: true,
      fillColor: Color(0xffF6F7F8),

      //Enabled Border
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0.r)),
          borderSide:
              BorderSide(color: AcnooAppColors.kNeutralColor200, width: 1.w)),

      //Focus Border
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10.0.r),
          ),
          borderSide:
              BorderSide(color: AcnooAppColors.kNeutralColor800, width: 1.w)),

      //Error Border
      errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10.0.r),
          ),
          borderSide:
              BorderSide(color: AcnooAppColors.kDangerHover, width: 1.w)),

      //Error Focus Border
      focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10.0.r),
          ),
          borderSide:
              BorderSide(color: AcnooAppColors.kDangerHover, width: 1.w)),

      //Suffix Icon Color
      suffixIconColor: AcnooAppColors.kNeutralColor400);

  static const kUnstyledInputDecoration = InputDecoration(
      border: OutlineInputBorder(borderSide: BorderSide.none),
      enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
      focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),
      focusedErrorBorder: OutlineInputBorder(borderSide: BorderSide.none),
      errorBorder: OutlineInputBorder(borderSide: BorderSide.none),
      disabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
      contentPadding: EdgeInsets.zero);

  static final InputDecoration kSearchInput = InputDecoration(
      floatingLabelBehavior: FloatingLabelBehavior.always,
      hintStyle: AcnooTextStyle.kBodySm
          .copyWith(color: AcnooAppColors.kNeutralColor400),
      floatingLabelStyle: AcnooTextStyle.kBodySm,
      isDense: true,
      labelStyle: AcnooTextStyle.kBodySm,

      //Enabled Border
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          borderSide: const BorderSide(color: Colors.transparent, width: 0)),

      //Disabled Border
      disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          borderSide: const BorderSide(color: Colors.transparent, width: 0)),

      //Focus Border
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
          borderSide: const BorderSide(color: Colors.transparent, width: 0)),

      //Error Border
      errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
          borderSide: const BorderSide(color: Colors.transparent, width: 0)),

      //Error Focus Border
      focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
          borderSide: const BorderSide(color: Colors.transparent, width: 0)),

      //Suffix Icon Color
      suffixIconColor: AcnooAppColors.kNeutralColor400);
}
