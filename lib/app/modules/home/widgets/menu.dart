import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/values/colors.dart';
import '../../../core/values/images.dart';

class DefaultMenuWidget extends StatelessWidget {
  const DefaultMenuWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 162.h,
          width: 174.w,
          margin: EdgeInsets.only(right: 12.w),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(7.0)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7.0),
                ),
                child: Container(
                  height: 143.h,
                  width: 155.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7.0),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 13.w, vertical: 5.h),
                        child: Text(
                          "Default Menu 1",
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontFamily: "Lexend-Medium",
                            fontWeight: FontWeight.w500,
                            color: ColorConstant.black,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 8.h, right: 10.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              height: 62.h,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "3 starters ",
                                    style: TextStyle(
                                      fontSize: 11.sp,
                                      fontFamily: "Lexend-Light",
                                      color: ColorConstant.black,
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 3.h),
                                    child: Text(
                                      "3 maincourse ",
                                      style: TextStyle(
                                        fontSize: 11.sp,
                                        fontFamily: "Lexend-Light",
                                        color: ColorConstant.black,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    "3 desserts  ",
                                    style: TextStyle(
                                      fontSize: 11.sp,
                                      fontFamily: "Lexend-Light",
                                      color: ColorConstant.black,
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 3.h),
                                    child: Text(
                                      "3 drinks ",
                                      style: TextStyle(
                                        fontSize: 11.sp,
                                        fontFamily: "Lexend-Light",
                                        color: ColorConstant.black,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 5.w),
                                child: Icon(
                                  Icons.person_2,
                                  size: 14.sp,
                                  color: ColorConstant.grey,
                                ),
                              ),
                              Text(
                                "Min 800",
                                style: TextStyle(
                                  fontSize: 11.sp,
                                  fontFamily: "Lexend-Regular",
                                  fontWeight: FontWeight.w500,
                                  color: ColorConstant.grey,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 5.h, vertical: 11.h),
                                child: Text(
                                  "Starts at",
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    fontFamily: "Lexend-Regular",
                                    fontWeight: FontWeight.w500,
                                    color: ColorConstant.primary,
                                  ),
                                ),
                              ),
                              Text(
                                "₹ 777",
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontFamily: "Lexend-Regular",
                                  fontWeight: FontWeight.w500,
                                  color: ColorConstant.primary,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 22.h),
              child: ClipOval(
                child: Image.asset(
                  ImagesConstant.menu,
                  width: 74.0.r,
                  height: 74.0.r,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
