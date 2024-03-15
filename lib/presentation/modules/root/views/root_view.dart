import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task2/presentation/modules/root/widget/add_product_bottom_sheet.dart';
import 'package:task2/presentation/modules/root/widget/root_empty_widget.dart';
import 'package:task2/presentation/modules/root/widget/root_list_item_graph_widget.dart';
import 'package:task2/presentation/modules/root/widget/root_list_item_widget.dart';
import 'package:task2/presentation/utils/colors.dart';

import '../controllers/root_controller.dart';
import 'package:get/get.dart';

class RootView extends GetView<RootController> {
  const RootView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Show Product',
          style: TextStyle(fontSize: 20.sp, color: ColorResources.white),
        ),
        backgroundColor: ColorResources.primary,
        centerTitle: true,
      ),
      body: GetBuilder<RootController>(
          builder: (controller) => controller.data.isNotEmpty
              ? ListView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  itemCount: controller.data.length,
                  itemBuilder: (context, index) =>
                      rootListItemWidget(controller.data[index]))
              : controller.dataGraph.isNotEmpty
                  ? ListView.builder(
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      itemCount: controller.dataGraph.length,
                      itemBuilder: (context, index) =>
                          rootListItemGraphWidget(controller.dataGraph[index]))
                  : rootEmptyWidget()),
      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorResources.primary,
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return const AddProductBottomSheetCustom();
            },
            isScrollControlled: true,
            useSafeArea: true,
            backgroundColor: Colors.transparent,
          );
        },
        child: Icon(
          Icons.add,
          color: ColorResources.white,
          size: 35.sp,
        ),
      ),
    );
  }
}
