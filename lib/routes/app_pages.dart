import 'package:bs_23/features/details/presentation/bindings/details_binding.dart';
import 'package:bs_23/features/details/presentation/views/details_view.dart';
import 'package:bs_23/features/home/presentation/bindings/home_binding.dart';
import 'package:bs_23/features/home/presentation/views/home_view.dart';
import 'package:get/get.dart';
part 'app_routes.dart';

class AppPages {
  AppPages._();

  static final List<GetPage> routes = [
    GetPage(
      name: _Paths.home,
      page: () =>  HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.details,
      page: () =>  DetailsView(),
      binding: DetailsBinding(),
    ),
  ];
}
