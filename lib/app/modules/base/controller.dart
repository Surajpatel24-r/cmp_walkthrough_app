import 'package:cmp_walkthrough_app/app/modules/home/view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BaseController extends GetxController {
  var index = 0.obs;

  void changeChipIndex(int value) {
    index.value = value;
  }

  List<Widget> widgetOptions = <Widget>[
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
  ].obs;
}
