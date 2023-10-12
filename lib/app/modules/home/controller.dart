import 'package:cmp_walkthrough_app/app/core/values/images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final ScrollController scrollController = ScrollController();

  // @override
  // void onInit() {
  //   super.onInit();

  //   // Start auto-scrolling when the controller is initialized
  //   startAutoScroll();
  // }

  // void startAutoScroll() {
  //   Future.delayed(Duration(seconds: 5), () {
  //     // Scroll to the end of the list (adjust the offset as needed)
  //     scrollController.animateTo(
  //       scrollController.position.maxScrollExtent,
  //       duration: Duration(seconds: 1),
  //       curve: Curves.easeInOut,
  //     );
  //     // Repeat auto-scrolling
  //     startAutoScroll();
  //   });
  // }

  // It a top of the home page list view
  final List<Map<String, dynamic>> data = [
    {
      'text': 'Enjoy your first order, the taste of our delicious food!',
      'image': AssetImage(ImagesConstant.main_top1),
    },
    {
      'text': 'Delicious food \nfor happy life',
      'image': AssetImage(ImagesConstant.main_top2),
    },
    // Add more data items as needed
  ];

  // this list is a Top Categories list
  final List<Map<String, dynamic>> categories = [
    {
      'text': 'Starters',
      'image': AssetImage(ImagesConstant.categories1),
    },
    {
      'text': 'Drinks',
      'image': AssetImage(ImagesConstant.categories2),
    },
    {
      'text': 'Rice',
      'image': AssetImage(ImagesConstant.categories3),
    },
    {
      'text': 'Curry',
      'image': AssetImage(ImagesConstant.categories4),
    },
    {
      'text': 'Desserts',
      'image': AssetImage(ImagesConstant.categories5),
    },
    {
      'text': 'Starters',
      'image': AssetImage(ImagesConstant.categories6),
    },
    // Add more data items as needed
  ];

  // this list is a Stater list
  final List<Map<String, dynamic>> starter = [
    {
      'text': "Grill Chicken",
      'image': AssetImage(ImagesConstant.stater1),
    },
    {
      'text': 'Mashroom Fry',
      'image': AssetImage(ImagesConstant.stater2),
    },
    {
      'text': 'Veggies Fry',
      'image': AssetImage(ImagesConstant.stater3),
    },
    {
      'text': 'Grill chicken',
      'image': AssetImage(ImagesConstant.stater4),
    },
    {
      'text': "Grill Chicken",
      'image': AssetImage(ImagesConstant.stater1),
    },
    {
      'text': 'Mashroom Fry',
      'image': AssetImage(ImagesConstant.stater2),
    },
    {
      'text': 'Veggies Fry',
      'image': AssetImage(ImagesConstant.stater3),
    },
    {
      'text': 'Grill chicken',
      'image': AssetImage(ImagesConstant.stater4),
    }
  ];

  // this list is a Stater list
  final List<Map<String, dynamic>> mainCourse = [
    {
      'text': "Biryani",
      'image': AssetImage(ImagesConstant.main_course1),
    },
    {
      'text': 'Bread',
      'image': AssetImage(ImagesConstant.main_course2),
    },
    {
      'text': 'Plain Rice',
      'image': AssetImage(ImagesConstant.main_course3),
    },
    {
      'text': 'Grill chicken',
      'image': AssetImage(ImagesConstant.main_course4),
    },
    {
      'text': "Biryani",
      'image': AssetImage(ImagesConstant.main_course1),
    },
    {
      'text': 'Bread',
      'image': AssetImage(ImagesConstant.main_course2),
    },
    {
      'text': 'Plain Rice',
      'image': AssetImage(ImagesConstant.main_course3),
    },
    {
      'text': 'Grill chicken',
      'image': AssetImage(ImagesConstant.main_course4),
    },
  ];

  // this list is a Services list
  final List<Map<String, dynamic>> services = [
    {
      'title': "Signature",
      'description1': "High Quality Disposable Cutlery",
      'description2': "Elegant Decorations & Table Settings",
      'description3': "Served by Waitstaff",
      'description4': "Best for Weddings, Corporate Events etc",
      'title_image': AssetImage(ImagesConstant.services1),
      'value_image': AssetImage(ImagesConstant.signature_badge),
      'showRecommended': true,
    },
    {
      'title': "Value",
      'description1': "Disposable Cutlery",
      'description2': "Basic Decorations & Table Settings",
      'description3': "Served in Buffet Style",
      'description4': "Best for Birthdays, Family Gathering etc",
      'title_image': AssetImage(ImagesConstant.services2),
      'value_image': AssetImage(ImagesConstant.green_badge),
      'showRecommended': false,
    },
    {
      'title': "Luxury",
      'description1': "High End Reusable Cutlery",
      'description2': "Elegant Decorations & Table Settings",
      'description3': "Served by Professional Waitstaff",
      'description4': "Best for Celebrity Parties, Political Events etc",
      'title_image': AssetImage(ImagesConstant.services3),
      'value_image': AssetImage(ImagesConstant.luxury_badge),
      'showRecommended': false,
    },
  ];

  // this list is a Work list
  final List<Map<String, dynamic>> work = [
    {
      'title': "Customize Menu",
      'description': "Select items for a single event or multiple events",
      'image': AssetImage(ImagesConstant.work1),
      'showLeftImage': true,
    },
    {
      'title': "Choose Services",
      'description':
          "Select the type of services from varying cutlery, mode of serving options, & more",
      'image': AssetImage(ImagesConstant.work2),
      'showLeftImage': false,
    },
    {
      'title': "Dynamic Pricing",
      'description':
          "Price per plate varies with no. of items in a plate and no. of plates selected",
      'image': AssetImage(ImagesConstant.work3),
      'showLeftImage': true,
    },
    {
      'title': "Track Your Order",
      'description':
          "Track the order status and seek help from the executives anytime",
      'image': AssetImage(ImagesConstant.work4),
      'showLeftImage': false,
    },
    {
      'title': "Taste Your Samples",
      'description':
          "Explode your taste bud with samples of what you order(on request for eligible orders)",
      'image': AssetImage(ImagesConstant.work5),
      'showLeftImage': true,
    },
    {
      'title': "Enjoy Food and Services",
      'description': "Enjoy event with delicious and customized food  ",
      'image': AssetImage(ImagesConstant.work6),
      'showLeftImage': false,
    },
  ];
}
