import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task2/data/models/data_graph/products.dart';
import 'package:task2/presentation/utils/colors.dart';

Widget rootListItemGraphWidget(Products data) => Card(
      elevation: 4.r,
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          Container(
            color: ColorResources.primary,
            padding: EdgeInsets.symmetric(vertical: 12.r, horizontal: 15.r),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Name: ',
                      style: TextStyle(
                          color: ColorResources.navyBlue,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Expanded(
                      child: Text(
                        data.nameAr,
                        style: TextStyle(
                            color: ColorResources.white,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            color: ColorResources.white,
            padding: EdgeInsets.symmetric(vertical: 12.r, horizontal: 15.r),
            child: Column(
              children: [
                data.category != null
                    ? Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Category: ',
                            style: TextStyle(
                                // color: ColorResources.red.withOpacity(.8),
                                color: ColorResources.lactic,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold),
                          ),
                          Expanded(
                            child: Text(
                              data.category!.nameAr.toString(),
                              style: TextStyle(
                                  color: ColorResources.black,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      )
                    : Container(),
              ],
            ),
          ),
        ],
      ),
    );
