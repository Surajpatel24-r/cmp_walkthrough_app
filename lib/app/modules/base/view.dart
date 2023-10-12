import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../core/values/colors.dart';
import '../../core/values/images.dart';
import 'controller.dart';

// ignore: must_be_immutable
class AppBase extends StatelessWidget {
  AppBase({super.key});

  var baseController = Get.put(BaseController());
  DateTime? _currentBackPressTime;

  Future<bool> _onWillPop() async {
    print("this is back button");
    if (_currentBackPressTime == null ||
        DateTime.now().difference(_currentBackPressTime!) >
            Duration(seconds: 2)) {
      _currentBackPressTime = DateTime.now();
      Get.snackbar("Press back again to exit", "");
      return false;
    } else {
      SystemNavigator.pop();
      return true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: Obx(() {
          return baseController.widgetOptions
              .elementAt(baseController.index.toInt());
        }),
        floatingActionButton: new FloatingActionButton(
          onPressed: () {},
          child: CircleAvatar(
            radius: 26.r,
            backgroundColor: ColorConstant.primary,
            child: Image(
              image: AssetImage(ImagesConstant.logo),
              height: 32.h,
            ),
          ),
          elevation: 4.0,
          backgroundColor: ColorConstant.secondry,
        ),
        bottomNavigationBar: Obx(
          () =>
              // BottomAppBar(
              //   height: 50.h,
              //   child: new Row(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: <Widget>[
              //       Expanded(
              //           child: Center(
              //         child: Container(
              //           child: Column(
              //             children: [
              //               Icon(
              //                 Icons.home,
              //                 size: 32.sp,
              //                 color: ColorConstant.primary,
              //               ),
              //               Text(
              //                 "Home",
              //                 style: TextStyle(
              //                   fontSize: 10.sp,
              //                   fontFamily: "Lexend-Regular",
              //                   color: ColorConstant.primary,
              //                 ),
              //               ),
              //             ],
              //           ),
              //         ),
              //       )),
              //       Expanded(
              //         child: Center(
              //           child: Container(
              //             child: Column(
              //               children: [
              //                 Icon(
              //                   Icons.favorite_border_sharp,
              //                   size: 32.sp,
              //                   color: ColorConstant.grey,
              //                 ),
              //                 Text(
              //                   "Wishlist",
              //                   style: TextStyle(
              //                     fontSize: 10.sp,
              //                     fontFamily: "Lexend-Regular",
              //                     color: ColorConstant.grey,
              //                   ),
              //                 ),
              //               ],
              //             ),
              //           ),
              //         ),
              //       ),
              //       Expanded(child: new Text('')),
              //       Expanded(
              //         child: Container(
              //           child: Column(
              //             children: [
              //               Icon(
              //                 Icons.dinner_dining_outlined,
              //                 size: 32.sp,
              //                 color: ColorConstant.grey,
              //               ),
              //               Text(
              //                 "Orders",
              //                 style: TextStyle(
              //                   fontSize: 10.sp,
              //                   fontFamily: "Lexend-Regular",
              //                   color: ColorConstant.grey,
              //                 ),
              //               ),
              //             ],
              //           ),
              //         ),
              //       ),
              //       Expanded(
              //         child: Container(
              //           child: Column(
              //             children: [
              //               Icon(
              //                 Icons.supervised_user_circle_outlined,
              //                 size: 32.sp,
              //                 color: ColorConstant.grey,
              //               ),
              //               Text(
              //                 "Profile",
              //                 style: TextStyle(
              //                   fontSize: 10.sp,
              //                   fontFamily: "Lexend-Regular",
              //                   color: ColorConstant.grey,
              //                 ),
              //               ),
              //             ],
              //           ),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              BottomNavigationBar(
            backgroundColor: Colors.white,
            onTap: (value) {
              baseController.changeChipIndex(value);
            },
            currentIndex: baseController.index.value,
            showUnselectedLabels: false,
            showSelectedLabels: true,
            unselectedItemColor: ColorConstant.grey,
            selectedItemColor: ColorConstant.primary,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                    size: 32.sp,
                  ),
                  label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.favorite_border_sharp,
                    size: 32.sp,
                  ),
                  label: 'Wishlist'),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.publish_sharp,
                    size: 1.sp,
                  ),
                  label: ''),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.dinner_dining_outlined,
                    size: 32.sp,
                  ),
                  label: 'Orders'),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.supervised_user_circle_outlined,
                    size: 32.sp,
                  ),
                  label: 'Profile'),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}
