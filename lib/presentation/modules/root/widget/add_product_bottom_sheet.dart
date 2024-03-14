import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:task2/data/dio/dio_controller.dart';
import 'package:task2/presentation/modules/root/controllers/root_controller.dart';
import 'package:task2/presentation/modules/root/widget/button_widget.dart';
import 'package:task2/presentation/utils/colors.dart';

class AddProductBottomSheetCustom extends GetView<RootController> {
  const AddProductBottomSheetCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RootController>(
        builder: (controller) => Padding(
              padding: EdgeInsets.only(top: 15.r),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Align(
                    alignment: AlignmentDirectional.topEnd,
                    child: InkWell(
                      onTap: () => Get.back(),
                      child: Container(
                          margin: EdgeInsetsDirectional.only(end: 10.r),
                          padding: EdgeInsets.all(15.r),
                          decoration: BoxDecoration(
                            color: ColorResources.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(13.r)),
                          ),
                          child: Icon(
                            Icons.close,
                            size: 22.sp,
                            color: ColorResources.black,
                          )),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Container(
                    width: 1.sw,
                    padding: EdgeInsets.all(10.r),
                    decoration: BoxDecoration(
                      color: ColorResources.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(13.r),
                        topRight: Radius.circular(13.r),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RangeSlider(
                          divisions: 100,
                          activeColor: ColorResources.primary,
                          inactiveColor: ColorResources.grey,
                          min: 0.0,
                          max: 1000.0,
                          values: controller.values,
                          onChanged: (value) {
                            controller.priceFrom =
                                value.start.toStringAsFixed(2);
                            controller.priceTo = value.end.toStringAsFixed(2);
                            controller.values = value;
                            controller.update();
                          },
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              controller.priceFrom,
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: ColorResources.black,
                              ),
                            ),
                            Text(
                              controller.priceTo,
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: ColorResources.black,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20.h),
                        Obx(
                          () => Get.find<DioController>()
                                  .isLoading(task: 'postData')
                              ? const Center(
                                  child: CircularProgressIndicator(
                                    color: ColorResources.primary,
                                  ),
                                )
                              : ButtonWidget(
                                  colorBtn: ColorResources.primary,
                                  text: Text(
                                    'Filter',
                                    style: TextStyle(
                                      color: ColorResources.white,
                                      fontSize: 15.sp,
                                    ),
                                  ),
                                  onPressed: () async {
                                    await controller
                                        .postData();
                                  },
                                  width: 1.sw,
                                  paddingHorizontal: 10,
                                  paddingVertical: 10,
                                ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ));
  }
}
