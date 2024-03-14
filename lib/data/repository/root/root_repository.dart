import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:task2/data/models/data/data.dart';

import 'root_remote_data_source.dart';

class RootRepository {
  late RootRemoteDataSource _rootRemoteDataSource;

  RootRepository() {
    _rootRemoteDataSource = RootRemoteDataSource();
  }

  Future<List<Data>> postData(String priceFrom, String priceTo) async {
    if (await InternetConnectionChecker().hasConnection) {
      return await _rootRemoteDataSource.postData(priceFrom, priceTo);
    } else {
      throw Exception('network not available');
    }
  }
}
