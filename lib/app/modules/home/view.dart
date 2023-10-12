// ignore_for_file: body_might_complete_normally_nullable

import 'package:cmp_walkthrough_app/app/core/values/images.dart';
import 'package:cmp_walkthrough_app/app/modules/home/controller.dart';
import 'package:cmp_walkthrough_app/app/modules/home/livepage.dart';
import 'package:cmp_walkthrough_app/app/modules/home/widgets/banner.dart';
import 'package:cmp_walkthrough_app/app/modules/home/widgets/categories.dart';
import 'package:cmp_walkthrough_app/app/modules/home/widgets/crafting.dart';
import 'package:cmp_walkthrough_app/app/modules/home/widgets/lable.dart';
import 'package:cmp_walkthrough_app/app/modules/home/widgets/menu.dart';
import 'package:cmp_walkthrough_app/app/modules/home/widgets/services.dart';
import 'package:cmp_walkthrough_app/app/modules/home/widgets/starter_main_course.dart';
import 'package:cmp_walkthrough_app/app/modules/home/widgets/work.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../core/values/colors.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final HomeController _controller = Get.put(HomeController());
  final String liveVideoUrl =
      "https://vod-progressive.akamaized.net/exp=1696590351~acl=%2Fvimeo-prod-skyfire-std-us%2F01%2F282%2F18%2F451412039%2F1985595747.mp4~hmac=c26f9064fa51f6222fae59a4fc360ba5de96a11a24563a4d37840c8dbece6815/vimeo-prod-skyfire-std-us/01/282/18/451412039/1985595747.mp4"; // Replace with your live video URL

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
      bottomNavigationBar: BottomAppBar(
        height: 54.h,
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
                child: Center(
              child: Container(
                child: Column(
                  children: [
                    Icon(
                      Icons.home,
                      size: 32.sp,
                      color: ColorConstant.primary,
                    ),
                    Text(
                      "Home",
                      style: TextStyle(
                        fontSize: 10.sp,
                        fontFamily: "Lexend-Regular",
                        color: ColorConstant.primary,
                      ),
                    ),
                  ],
                ),
              ),
            )),
            Expanded(
              child: Center(
                child: Container(
                  child: Column(
                    children: [
                      Icon(
                        Icons.favorite_border_sharp,
                        size: 32.sp,
                        color: ColorConstant.grey,
                      ),
                      Text(
                        "Wishlist",
                        style: TextStyle(
                          fontSize: 10.sp,
                          fontFamily: "Lexend-Regular",
                          color: ColorConstant.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(child: new Text('')),
            Expanded(
              child: Container(
                child: Column(
                  children: [
                    Icon(
                      Icons.dinner_dining_outlined,
                      size: 32.sp,
                      color: ColorConstant.grey,
                    ),
                    Text(
                      "Orders",
                      style: TextStyle(
                        fontSize: 10.sp,
                        fontFamily: "Lexend-Regular",
                        color: ColorConstant.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                child: Column(
                  children: [
                    Icon(
                      Icons.supervised_user_circle_outlined,
                      size: 32.sp,
                      color: ColorConstant.grey,
                    ),
                    Text(
                      "Profile",
                      style: TextStyle(
                        fontSize: 10.sp,
                        fontFamily: "Lexend-Regular",
                        color: ColorConstant.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.w),
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 8.h),
                              child: Text(
                                "Hi, Monica!",
                                style: TextStyle(
                                  fontSize: 22.sp,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Lexend-Regular",
                                  color: ColorConstant.primary,
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(bottom: 3.h),
                                      child: Text(
                                        "Current Location",
                                        style: TextStyle(
                                          fontSize: 12.sp,
                                          fontFamily: "Lexend-Light",
                                          color: ColorConstant.grey,
                                        ),
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.location_on_rounded,
                                          color: ColorConstant.primary,
                                          size: 16.sp,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(left: 2.w),
                                          child: Text(
                                            "Hydrabad",
                                            style: TextStyle(
                                              fontSize: 12.sp,
                                              fontFamily: "Lexend-Regular",
                                              color: ColorConstant.grey,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Get.to(() => LiveVideoPopup(
                                              videoUrl: liveVideoUrl,
                                            ));
                                      },
                                      child: Icon(
                                        Icons.play_circle_outline,
                                        color: ColorConstant.primary,
                                        size: 24.sp,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(bottom: 3.h),
                                      child: Text(
                                        "How it works?",
                                        style: TextStyle(
                                          fontSize: 10.sp,
                                          fontFamily: "Lexend-Light",
                                          color: ColorConstant.grey,
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
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 24.w, vertical: 24.h),
                      child: SizedBox(
                        height: 148.h,
                        child: ListView.builder(
                          // controller: _controller.scrollController,
                          scrollDirection: Axis.horizontal,
                          itemCount: _controller.data.length,
                          itemBuilder: (context, index) {
                            final item = _controller.data[index];
                            return BannerWidget(
                              text: item['text'],
                              image: item['image'],
                            );
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.w),
                      child: Card(
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: TextFormField(
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontFamily: "Lexend-Light",
                            color: ColorConstant.grey,
                          ),
                          controller: TextEditingController(),
                          validator: (value) {},
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            suffixIcon: Icon(
                              Icons.search,
                              color: ColorConstant.primary,
                            ),
                            hintText: "Search food or events ",
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(
                                  color: ColorConstant.primary_light),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(
                                  color: ColorConstant.primary_light),
                            ),
                            contentPadding: const EdgeInsets.all(12.0),
                          ),
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              top: 27.h, bottom: 10.h, left: 24.w),
                          child: Lable(
                            text: "Start Crafting",
                            color: ColorConstant.primary,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 24.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CraftingWidget(
                                text: "Default Platters",
                                image: AssetImage(ImagesConstant.crafting1),
                              ),
                              CraftingWidget(
                                text: "Craft Your Own ",
                                image: AssetImage(ImagesConstant.crafting2),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 20.h, horizontal: 24.w),
                          child: SizedBox(
                            height: 160.h,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: 10,
                              itemBuilder: (context, index) {
                                return DefaultMenuWidget();
                              },
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 24.w),
                          child: Lable(
                            text: "Top Categories",
                            color: ColorConstant.black,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 24.w, vertical: 20.h),
                          child: SizedBox(
                            height: 90.h,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              controller: _controller.scrollController,
                              itemCount: _controller.categories.length,
                              itemBuilder: (context, index) {
                                final item = _controller.categories[index];
                                return CategoriesWidgets(
                                  text: item['text'],
                                  image: item['image'],
                                );
                              },
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 24.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Lable(
                                text: "Starters",
                                color: ColorConstant.black,
                              ),
                              TextButton(
                                onPressed: () {},
                                child: Text(
                                  "More Starters",
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    fontFamily: "Lexend-Regular",
                                    color: ColorConstant.primary,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 24.w, vertical: 10.h),
                          child: SizedBox(
                            height: 110.h,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: _controller.starter.length,
                              itemBuilder: (context, index) {
                                final item = _controller.starter[index];
                                return StarterMainCourseWidget(
                                  text: item['text'],
                                  image: item['image'],
                                );
                              },
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 24.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Lable(
                                text: "Main Course",
                                color: ColorConstant.black,
                              ),
                              TextButton(
                                onPressed: () {},
                                child: Text(
                                  "More Main Courses",
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    fontFamily: "Lexend-Regular",
                                    color: ColorConstant.primary,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 24.w, vertical: 10.h),
                          child: SizedBox(
                            height: 110.h,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: _controller.mainCourse.length,
                              itemBuilder: (context, index) {
                                final item = _controller.mainCourse[index];
                                return StarterMainCourseWidget(
                                  text: item['text'],
                                  image: item['image'],
                                );
                              },
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 24.w),
                          child: Lable(
                            text: "Services",
                            color: ColorConstant.black,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 24.w),
                          child: SizedBox(
                            height: 344.h,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: _controller.services.length,
                              itemBuilder: (context, index) {
                                final item = _controller.services[index];
                                return ServiceWidget(
                                  title: item['title'],
                                  description1: item['description1'],
                                  description2: item['description2'],
                                  description3: item['description3'],
                                  description4: item['description4'],
                                  title_image: item['title_image'],
                                  value_image: item['value_image'],
                                  showRecommended: item['showRecommended'],
                                );
                              },
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 24.w, vertical: 20.h),
                          child: Lable(
                            text: "How does it work ?",
                            color: ColorConstant.black,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            height: 668.h,
                            child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: _controller.work.length,
                              itemBuilder: (context, index) {
                                final item = _controller.work[index];
                                return WorkWidget(
                                  title: item['title'],
                                  description: item['description'],
                                  image: item['image'],
                                  showLeftImage: item['showLeftImage'],
                                );
                              },
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 24.w, vertical: 24.h),
                          child: Container(
                            width: 255.w,
                            child: Text(
                              "Delicious food with professional service !",
                              style: TextStyle(
                                fontSize: 25.sp,
                                fontFamily: "Lexend-Regular",
                                color: ColorConstant.black,
                              ),
                            ),
                          ),
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
    );
  }
}
