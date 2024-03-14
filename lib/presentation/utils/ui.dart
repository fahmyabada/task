import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task2/presentation/utils/colors.dart';

class Ui {
  static GetSnackBar successSnackBar(
      {String title = 'Success', String message = ''}) {
    Get.log("[$title] $message");
    return GetSnackBar(
      titleText: Text(title.tr,
          style: Get.textTheme.titleLarge
              ?.merge(TextStyle(color: Get.theme.primaryColor))),
      messageText: Text(message,
          style: Get.textTheme.bodySmall!
              .merge(TextStyle(color: Get.theme.primaryColor))),
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.all(20),
      backgroundColor: ColorResources.white,
      icon: Icon(Icons.check_circle_outline,
          size: 32, color: Get.theme.primaryColor),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      borderRadius: 8,
      dismissDirection: DismissDirection.horizontal,
      duration: const Duration(seconds: 2),
    );
  }

  static GetSnackBar errorSnackBar(
      {String title = 'Error', String message = ''}) {
    Get.log("[$title] $message", isError: true);
    return GetSnackBar(
      titleText: Text(title.tr,
          style: Get.textTheme.titleLarge
              ?.merge(const TextStyle(color: ColorResources.white))),
      messageText: Text(message.substring(0, min(message.length, 200)),
          style: Get.textTheme.bodySmall!
              .merge(const TextStyle(color: ColorResources.white))),
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.all(20),
      backgroundColor: ColorResources.red,
      icon: const Icon(Icons.remove_circle_outline,
          size: 32, color: ColorResources.white),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      borderRadius: 8,
      duration: const Duration(seconds: 2),
    );
  }

  static GetSnackBar defaultSnackBar(
      {String title = 'Alert', String message = ''}) {
    Get.log("[$title] $message", isError: false);
    return GetSnackBar(
      titleText: Text(title.tr,
          style: Get.textTheme.titleLarge
              ?.merge(TextStyle(color: Get.theme.hintColor))),
      messageText: Text(message,
          style: Get.textTheme.bodySmall!
              .merge(TextStyle(color: Get.theme.focusColor))),
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.all(20),
      backgroundColor: Get.theme.primaryColor,
      borderColor: Get.theme.focusColor.withOpacity(0.1),
      icon: Icon(Icons.warning_amber_rounded,
          size: 32, color: Get.theme.hintColor),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      borderRadius: 8,
      duration: const Duration(seconds: 5),
    );
  }
}
