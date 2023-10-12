// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/values/colors.dart';

class WorkWidget extends StatelessWidget {
  final String title;
  final String description;
  final bool showLeftImage;
  ImageProvider<Object> image;

  WorkWidget({
    super.key,
    required this.title,
    required this.description,
    required this.image,
    this.showLeftImage = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 114.h,
      child: showLeftImage == true
          ? Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 110.h,
                      child: Image(
                        image: image,
                        // fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      height: 70.h,
                      width: 198.w,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "$title",
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              fontFamily: "Lexend-Medium",
                              color: ColorConstant.primary,
                            ),
                          ),
                          Text(
                            "$description",
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontFamily: "Lexend-Light",
                              color: ColorConstant.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            )
          : Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 70.h,
                      width: 198.w,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "$title",
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              fontFamily: "Lexend-Medium",
                              color: ColorConstant.primary,
                            ),
                          ),
                          Text(
                            "$description",
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontFamily: "Lexend-Light",
                              color: ColorConstant.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 110.h,
                      child: Image(
                        image: image,
                        // fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ],
            ),
    );
  }
}
