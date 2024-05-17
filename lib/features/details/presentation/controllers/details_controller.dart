import 'package:bs_23/features/home/domain/entities/git_repo_entity.dart';
import 'package:get/get.dart';

class DetailsController extends GetxController{

  late GitRepoEntity gitRepo;

  @override
  void onInit() {
    super.onInit();
    gitRepo=Get.arguments;
  }

}