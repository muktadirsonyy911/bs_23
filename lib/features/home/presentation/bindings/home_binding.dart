import 'package:bs_23/features/home/presentation/controllers/home_controller.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings{

  @override
  void dependencies() {
    Get.lazyPut<HomeController>(()=>HomeController());
  }

}