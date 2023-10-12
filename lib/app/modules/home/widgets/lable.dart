// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Lable extends StatelessWidget {
  final String text;
  Color? color;
  Lable({
    super.key,
    required this.text,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      "$text",
      style: TextStyle(
        fontSize: 20.sp,
        fontFamily: "Lexend-Regular",
        color: color,
      ),
    );
  }
}
