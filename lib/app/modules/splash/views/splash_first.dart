import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/values/colors.dart';
import '../../../core/values/images.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.secondry,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(ImagesConstant.splash_bg),
            fit: BoxFit.fill,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 110.h,
                width: 88.w,
                child: Image(
                  image: AssetImage(ImagesConstant.logo),
                  fit: BoxFit.fill,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 18.h),
                child: Text(
                  "Welcome",
                  style: TextStyle(
                    fontSize: 32.sp,
                    fontFamily: "Capriola",
                    color: ColorConstant.secondry,
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
