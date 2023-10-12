import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/values/colors.dart';
import '../../../core/values/images.dart';

class SplashScreen2 extends StatelessWidget {
  const SplashScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.primary,
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                // height: 141.55.h,
                width: 124.62.w,
                child: Image(
                  image: AssetImage(ImagesConstant.logo),
                  fit: BoxFit.fill,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 12.h),
                child: Text(
                  "Craft My Plate",
                  style: TextStyle(
                    fontSize: 32.sp,
                    fontFamily: "Capriola",
                    color: ColorConstant.secondry,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 3.h),
                child: Text(
                  "You customise, We cater",
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontFamily: "Courgette",
                    color: ColorConstant.secondry_light,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
