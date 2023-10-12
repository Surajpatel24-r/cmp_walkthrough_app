// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/values/colors.dart';
import '../../../core/values/images.dart';

class ServiceWidget extends StatelessWidget {
  ImageProvider<Object> title_image;
  ImageProvider<Object> value_image;
  final String title;
  final String description1;
  final String description2;
  final String description3;
  final String description4;
  void Function()? onPressed;
  final bool showRecommended;

  ServiceWidget({
    super.key,
    required this.title,
    required this.description1,
    required this.description2,
    required this.description3,
    required this.description4,
    required this.title_image,
    required this.value_image,
    this.onPressed,
    this.showRecommended = false,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      child: Container(
        height: 336.h,
        // width: 310.w,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(6)),
        child: Stack(
          children: [
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(16.w),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Image(
                      image: title_image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Image(
                              height: 20.h,
                              // width: 20.w,
                              image: value_image,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 8.w),
                              child: Text(
                                "$title",
                                style: TextStyle(
                                  fontSize: 18.sp,
                                  fontFamily: "Lexend-Regular",
                                  color: ColorConstant.primary,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 10.h),
                          child: Row(
                            children: [
                              Image(
                                height: 17.h,
                                // width: 15.w,
                                image: AssetImage(ImagesConstant.star_icon),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 8.w),
                                child: Text(
                                  "$description1",
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontFamily: "Lexend-Light",
                                    color: ColorConstant.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Image(
                              height: 17.h,
                              // width: 15.w,
                              image: AssetImage(ImagesConstant.star_icon),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 8.w),
                              child: Text(
                                "$description2",
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontFamily: "Lexend-Light",
                                  color: ColorConstant.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 10.h),
                          child: Row(
                            children: [
                              Image(
                                height: 17.h,
                                // width: 15.w,
                                image: AssetImage(ImagesConstant.star_icon),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 8.w),
                                child: Text(
                                  "$description3",
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontFamily: "Lexend-Light",
                                    color: ColorConstant.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Image(
                              height: 17.h,
                              // width: 15.w,
                              image: AssetImage(ImagesConstant.star_icon),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 8.w),
                              child: Text(
                                "$description4",
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontFamily: "Lexend-Light",
                                  color: ColorConstant.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.h),
                  child: TextButton(
                    onPressed: onPressed,
                    child: Text(
                      "Know More",
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontFamily: "Lexend-Medium",
                        color: ColorConstant.primary,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            if (showRecommended)
              Positioned(
                top: 0,
                right: 0,
                child: Container(
                  height: 30.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(6),
                      bottomLeft: Radius.circular(6),
                    ),
                    color: ColorConstant.primary,
                  ),
                  child: Center(
                    child: Text(
                      " Recommended ",
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontFamily: "Lexend-Regular",
                        color: ColorConstant.white,
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
