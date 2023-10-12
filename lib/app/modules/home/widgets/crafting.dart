// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/values/colors.dart';

class CraftingWidget extends StatelessWidget {
  ImageProvider<Object> image;
  final String text;
  CraftingWidget({super.key, required this.text, required this.image});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Container(
        height: 120.h,
        width: 154.5.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Container(
              height: 90.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                image: DecorationImage(
                  image: image,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 7.h),
              child: Text(
                "$text",
                style: TextStyle(
                  fontSize: 14.sp,
                  fontFamily: "Lexend-Regular",
                  color: ColorConstant.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
