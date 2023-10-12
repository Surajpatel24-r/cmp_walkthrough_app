// ignore_for_file: body_might_complete_normally_nullable
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../core/values/colors.dart';
import '../../../core/values/images.dart';
import '../controller.dart';

class AuthScreen extends StatelessWidget {
  AuthScreen({super.key});

  final _controller = Get.put(AuthScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _controller.loginFormKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 243.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(ImagesConstant.login_top_bg),
                          fit: BoxFit.fill,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 54.h),
                            child: Container(
                              height: 69.h,
                              width: 69.w,
                              child: Image(
                                image: AssetImage(ImagesConstant.logo),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: 85.h, top: 6.h),
                            child: Text(
                              "CraftMyPlate",
                              style: TextStyle(
                                fontSize: 20.sp,
                                fontFamily: "Lexend-Regular",
                                color: ColorConstant.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: 47.0.h, left: 24.w, bottom: 24.h),
                      child: Text(
                        "Login or Signup",
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Lexend-Medium",
                          color: ColorConstant.grey,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.w),
                      child: TextFormField(
                        style: Theme.of(context).textTheme.bodyMedium,
                        controller: _controller.numberEditingController,
                        keyboardType: TextInputType.phone,
                        validator: (value) {},
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6.0),
                          ),
                          hintText: "Enter Phone number",
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6),
                            borderSide: const BorderSide(
                                color: ColorConstant.primary_light),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6),
                            borderSide: const BorderSide(
                                color: ColorConstant.primary_light),
                          ),
                          prefixIcon: Container(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(
                              onTap: () {
                                showCountryPicker(
                                    context: context,
                                    countryListTheme:
                                        const CountryListThemeData(
                                      bottomSheetHeight: 550,
                                    ),
                                    onSelect: (value) {
                                      _controller.onSelectCountry(value);
                                    });
                              },
                              child: Container(
                                padding: const EdgeInsets.all(8.0),
                                child: Obx(() {
                                  return Text(
                                    "+${_controller.selectedCountry.value.phoneCode}",
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: ColorConstant.black,
                                    ),
                                  );
                                }),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 24.w, vertical: 16.h),
                      child: SizedBox(
                        height: 42.h,
                        width: double.infinity,
                        child: Obx(
                          () => ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: ColorConstant.primary,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            onPressed: () {
                              _controller.phoneNumberAuthentication();
                            },
                            child: _controller.isLoading.value == false
                                ? Text(
                                    "Continue",
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "Lexend-Regular",
                                    ),
                                  )
                                : Center(
                                    child: CircularProgressIndicator(
                                      color: ColorConstant.secondry,
                                    ),
                                  ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Column(
              children: [
                Center(
                  child: Container(
                    height: 40.h,
                    width: 197.w,
                    child: Text(
                      "By continuing, you agree to our Terms of Service   Privacy Policy",
                      style: TextStyle(
                        fontSize: 13.sp,
                        fontFamily: "Lexend-Light",
                        color: ColorConstant.grey,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 134.w),
                  child: Container(
                    height: 5.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100), // Curve ka size
                      color: ColorConstant.black, // Divider color
                    ),
                  ),
                ),
                SizedBox(height: 6.h),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
