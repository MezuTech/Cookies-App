import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppText {
  static TextStyle boldHeader({
    Color? color,
    double? fontSize,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      color: color,
      fontSize: fontSize ?? 39.sp,
      decoration: decoration,
    );
  }

  static TextStyle regular({
    Color? color,
    double? fontSize,
    TextDecoration? decoration,
  }) {
    return TextStyle(
        color: color, fontSize: fontSize ?? 35.sp, decoration: decoration);
  }

  static TextStyle semiBoldHeader({
    Color? color,
    double? fontSize,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      color: color,
      fontSize: fontSize ?? 31.sp,
      decoration: decoration,
    );
  }

  static TextStyle light({
    Color? color,
    double? fontSize,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      color: color,
      fontSize: fontSize ?? 27.sp,
      decoration: decoration,
    );
  }

  static TextStyle extraLight({
    Color? color,
    double? fontSize,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      color: color,
      fontSize: fontSize ?? 27.sp,
      decoration: decoration,
    );
  }
}
