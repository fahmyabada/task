import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task2/data/models/data/data.dart';
import 'package:task2/presentation/utils/colors.dart';

Widget rootListItemWidget(Data data) => Card(
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
                        '${data.firstName} ${data.lastName}',
                        style: TextStyle(
                            color: ColorResources.white,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5.h,
                ),
                Row(
                  children: [
                    Text(
                      'Email: ',
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
                        data.email,
                        style: TextStyle(
                            color: ColorResources.white,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5.h,
                ),
                Row(
                  children: [
                    Text(
                      'Address: ',
                      style: TextStyle(
                          // color: ColorResources.red.withOpacity(.8),
                          color: ColorResources.navyBlue,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Expanded(
                      child: Text(
                        data.address,
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
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Mobile: ',
                      style: TextStyle(
                          // color: ColorResources.red.withOpacity(.8),
                          color: ColorResources.lactic,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold),
                    ),
                    Expanded(
                      child: Text(
                        data.mobile,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: ColorResources.black,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5.h,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Gender: ',
                      style: TextStyle(
                          // color: ColorResources.red.withOpacity(.8),
                          color: ColorResources.lactic,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold),
                    ),
                    Expanded(
                      child: Text(
                        data.gender,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: ColorResources.black,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5.h,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Biography: ',
                      style: TextStyle(
                          // color: ColorResources.red.withOpacity(.8),
                          color: ColorResources.lactic,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold),
                    ),
                    Expanded(
                      child: Text(
                        data.biography,
                        style: TextStyle(
                            color: ColorResources.black,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5.h,
                ),
                data.category.isNotEmpty
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
                              data.category[0].nameEn,
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
