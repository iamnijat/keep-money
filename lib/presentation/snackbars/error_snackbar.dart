import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../core/constants/palette.dart';
import '../../core/constants/styles.dart';

class ErrorSnackbar {
  static SnackBar showErrorSnackBar(String? message) {
    return SnackBar(
      behavior: SnackBarBehavior.floating,
      duration: const Duration(seconds: 2),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Flexible(
            child: Padding(
              padding: EdgeInsets.only(right: 5.w),
              child: Text(message.toString(),
                  style: AppStyles.errorSnackbarTextStyle),
            ),
          ),
          const Icon(Icons.error, color: AppPalette.whiteColor),
        ],
      ),
      backgroundColor: AppPalette.errorColor,
    );
  }
}
