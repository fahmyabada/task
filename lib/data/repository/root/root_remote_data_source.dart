import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:task2/data/dio/dio_controller.dart';
import 'package:task2/data/models/data/data.dart';

import '../../models/data/data_model.dart';

class RootRemoteDataSource {
  final DioController dioController = Get.find();

  Future<List<Data>> postData(String priceFrom, String priceTo) async {
    var body = {
      "price_from": double.parse(priceFrom),
      "price_to": double.parse(priceTo),
      "category_id": "659c11de870fb96c7a2c0057",
      "city_id": "65ad623ec4d5a2a836c60ff6"
    };
    Get.log('body******${json.encode(body)}');
    Uri uri = dioController.getApiBaseUri("api/doctors/doctorFilter");
    return await dioController.httpClient
        .postUri(uri,
            data: json.encode(body),
            options: Options(headers: {
              'Content-Type': 'application/json',
            }))
        .then((value) {
      if (value.statusCode == 200) {
        return DataModel.fromJson(value.data).data!;
      } else {
        throw Exception('Server Failure Message');
      }
    });
  }
}
