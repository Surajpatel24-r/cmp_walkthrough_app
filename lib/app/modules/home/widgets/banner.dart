// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/values/colors.dart';
import 'package:dotted_border/dotted_border.dart';

class BannerWidget extends StatelessWidget {
  final String text;
  ImageProvider<Object> image;
  BannerWidget({
    super.key,
    required this.text,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130.h,
      width: 328.w,
      margin: EdgeInsets.only(right: 10.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: ColorConstant.black,
        image: DecorationImage(
          image: image,
          fit: BoxFit.fill,
        ),
      ),
      child: Stack(
        children: [
          Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 14.h, left: 12.w),
                child: Container(
                  width: 145.w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "$text",
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontFamily: "Lexend-Medium",
                          fontWeight: FontWeight.w600,
                          color: ColorConstant.white,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 14.h),
                        child: DottedBorder(
                          strokeWidth: 1,
                          dashPattern: [5, 2],
                          color: ColorConstant.grey,
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "FIRSTPLATE01",
                              style: TextStyle(
                                fontSize: 13.sp,
                                fontFamily: "Lexend-Regular",
                                fontWeight: FontWeight.w500,
                                color: ColorConstant.secondry,
                                letterSpacing: 0.8,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
