// ignore_for_file: body_might_complete_normally_nullable, unused_field
import 'package:cmp_walkthrough_app/app/core/values/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../core/values/colors.dart';
import '../../../data/providers/firebase_provider.dart';
import '../controller.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class OtpScreen extends StatelessWidget {
  final String? verificationId;
  final String formattedPhoneNumber;
  OtpScreen(
      {super.key, this.verificationId, required this.formattedPhoneNumber});

  final _controller = Get.put(AuthScreenController());
  final FirebaseProvider _firebaseProvider = FirebaseProvider();

  @override
  Widget build(BuildContext context) {
    var otp;
    return Scaffold(
      backgroundColor: Color(0xfffF7F6F0),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xfffF7F6F0),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back_ios_outlined),
          color: ColorConstant.black,
          iconSize: 18.sp,
        ),
        title: Text(
          "OTP Verfication",
          style: TextStyle(
            fontSize: 14.sp,
            fontFamily: "Lexend-Regular",
            color: ColorConstant.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _controller.otpFormKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: 24.h, bottom: 6.h),
                      child: Text(
                        "We have sent a verification code to",
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontFamily: "Lexend-Regular",
                          fontWeight: FontWeight.w400,
                          color: ColorConstant.grey,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 44.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 8.w),
                          child: Text(
                            "+91-$formattedPhoneNumber",
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontFamily: "Lexend-Medium",
                              fontWeight: FontWeight.w500,
                              color: ColorConstant.black,
                              letterSpacing: 0.5,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 24.h,
                          width: 24.w,
                          child: Image(
                            image: AssetImage(ImagesConstant.verify),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 34.w, vertical: 5.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        OtpTextField(
                          mainAxisAlignment: MainAxisAlignment.center,
                          numberOfFields: 6,
                          borderColor: ColorConstant.grey,
                          showFieldAsBox: false,
                          borderWidth: 2.0,
                          focusedBorderColor: ColorConstant.primary,
                          onSubmit: (String code) {
                            otp = code;
                            _controller.otpVerificationAndLogin(otp);
                          },
                        ),

                        // Container(
                        //   height: 50.h,
                        //   width: 35.w,
                        //   child: TextFormField(
                        //     controller: _controller.otpEditingController,
                        //     onChanged: (value) {
                        //       if (value.length == 1) {
                        //         FocusScope.of(context).nextFocus();
                        //       }
                        //     },
                        //     textAlign: TextAlign.center,
                        //     keyboardType: TextInputType.number,
                        //     inputFormatters: [
                        //       LengthLimitingTextInputFormatter(1),
                        //       FilteringTextInputFormatter.digitsOnly,
                        //     ],
                        //   ),
                        // ),
                        // Container(
                        //   height: 50.h,
                        //   width: 35.w,
                        //   child: TextFormField(
                        //     controller: _controller.otpEditingController,
                        //     onChanged: (value) {
                        //       if (value.length == 1) {
                        //         FocusScope.of(context).nextFocus();
                        //       }
                        //     },
                        //     textAlign: TextAlign.center,
                        //     keyboardType: TextInputType.number,
                        //     inputFormatters: [
                        //       LengthLimitingTextInputFormatter(1),
                        //       FilteringTextInputFormatter.digitsOnly,
                        //     ],
                        //   ),
                        // ),
                        // Container(
                        //   height: 50.h,
                        //   width: 35.w,
                        //   child: TextFormField(
                        //     controller: _controller.otpEditingController,
                        //     onChanged: (value) {
                        //       if (value.length == 1) {
                        //         FocusScope.of(context).nextFocus();
                        //       }
                        //     },
                        //     textAlign: TextAlign.center,
                        //     keyboardType: TextInputType.number,
                        //     inputFormatters: [
                        //       LengthLimitingTextInputFormatter(1),
                        //       FilteringTextInputFormatter.digitsOnly,
                        //     ],
                        //   ),
                        // ),
                        // Container(
                        //   height: 50.h,
                        //   width: 35.w,
                        //   child: TextFormField(
                        //     controller: _controller.otpEditingController,
                        //     onChanged: (value) {
                        //       if (value.length == 1) {
                        //         FocusScope.of(context).nextFocus();
                        //       }
                        //     },
                        //     textAlign: TextAlign.center,
                        //     keyboardType: TextInputType.number,
                        //     inputFormatters: [
                        //       LengthLimitingTextInputFormatter(1),
                        //       FilteringTextInputFormatter.digitsOnly,
                        //     ],
                        //   ),
                        // ),
                        // Container(
                        //   height: 50.h,
                        //   width: 35.w,
                        //   child: TextFormField(
                        //     controller: _controller.otpEditingController,
                        //     onChanged: (value) {
                        //       if (value.length == 1) {
                        //         FocusScope.of(context).nextFocus();
                        //       }
                        //     },
                        //     textAlign: TextAlign.center,
                        //     keyboardType: TextInputType.number,
                        //     inputFormatters: [
                        //       LengthLimitingTextInputFormatter(1),
                        //       FilteringTextInputFormatter.digitsOnly,
                        //     ],
                        //   ),
                        // ),
                        // Container(
                        //   height: 50.h,
                        //   width: 35.w,
                        //   child: TextFormField(
                        //     controller: _controller.otpEditingController,
                        //     onChanged: (value) {
                        //       if (value.length == 1) {
                        //         FocusScope.of(context).nextFocus();
                        //       }
                        //     },
                        //     textAlign: TextAlign.center,
                        //     keyboardType: TextInputType.number,
                        //     inputFormatters: [
                        //       LengthLimitingTextInputFormatter(1),
                        //       FilteringTextInputFormatter.digitsOnly,
                        //     ],
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
                    child: SizedBox(
                      height: 42.h,
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ColorConstant.primary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onPressed: () {
                          // Get.off(() => OnboardingScreen());
                          _controller.otpVerificationAndLogin(otp);
                        },
                        child: Text(
                          "Submit",
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Lexend-Regular",
                          ),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Didn’t receive code?",
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontFamily: "Lexend-Regular",
                          wordSpacing: 1.0,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 8.w),
                        child: InkWell(
                          onTap: () {
                            _controller.phoneNumberAuthentication();
                          },
                          child: Text(
                            "Resend Again.",
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontFamily: "Lexend-Regular",
                              wordSpacing: 0.5,
                              color: ColorConstant.primary,
                            ),
                          ),
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
    );
  }
}
