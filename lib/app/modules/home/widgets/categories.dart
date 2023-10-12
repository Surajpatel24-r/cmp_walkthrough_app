// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/values/colors.dart';

class CategoriesWidgets extends StatelessWidget {
  final String text;
  ImageProvider<Object> image;
  CategoriesWidgets({super.key, required this.text, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 14.w),
      child: Column(
        children: [
          Container(
            height: 70.h,
            child: Image(
              image: image,
              fit: BoxFit.fill,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 5.h),
            child: Text(
              "$text",
              style: TextStyle(
                fontSize: 12.sp,
                fontFamily: "Lexend-Light",
                color: ColorConstant.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
