import 'package:get/get.dart';
import 'package:task2/presentation/modules/root/bindings/root_binding.dart';
import 'package:task2/presentation/modules/root/views/root_view.dart';

import 'app_routes.dart';

class AppPages {
  static const initial = Routes.root;

  static final routes = [
    GetPage(
      name: Routes.root,
      page: () => const RootView(),
      binding: RootBinding(),
    ),
  ];
}
