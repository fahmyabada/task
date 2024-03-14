import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task2/data/models/data/data.dart';
import 'package:task2/data/repository/root/root_repository.dart';
import 'package:task2/presentation/utils/ui.dart';

class RootController extends GetxController {
  late RootRepository _rootRepository;
  String priceFrom = 0.toString(), priceTo = 1000.toString();
  List<Data> data = [];
  RangeValues values = const RangeValues(0.0, 1000.0);

  RootController() {
    _rootRepository = RootRepository();
  }

  @override
  Future<void> onInit() async {
    super.onInit();
  }

  Future postData() async {
    try {
      final result = await _rootRepository.postData(priceFrom, priceTo);
      data.assignAll(result);
      Get.back();
    } catch (e) {
      Get.showSnackbar(Ui.errorSnackBar(message: e.toString()));
    }finally{
      update();
    }
  }
}
