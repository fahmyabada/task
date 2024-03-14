import 'package:get/get.dart';
import 'package:task2/data/dio/api_provider.dart';

class DioController extends GetxService with ApiClient {
  @override
  Future<DioController> init() async {
    super.init();
    return this;
  }
}
