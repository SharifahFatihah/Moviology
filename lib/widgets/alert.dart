import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:movie_app/widgets/toast_alert.dart';

Future<void> toastAlert({Color? themeColor, required String message}) {
  return Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: themeColor ?? Colors.transparent,
    textColor: Colors.white,
    fontSize: 12.sp,
  );
}
