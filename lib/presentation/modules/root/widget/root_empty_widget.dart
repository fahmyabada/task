import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task2/presentation/utils/colors.dart';

Widget rootEmptyWidget() => Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 1.sw,
          padding: EdgeInsets.symmetric(vertical: 20.r),
          margin: EdgeInsets.symmetric(horizontal: 37.r),
          decoration: BoxDecoration(
            color: ColorResources.primary,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(25.r),
          ),
          child: Column(
            children: [
              SizedBox(
                height: 15.h,
              ),
              Text(
                'not found Data',
                style: TextStyle(
                    fontSize: 22.sp,
                    color: ColorResources.white,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 15.h,
              ),
            ],
          ),
        ),
      ],
    );
