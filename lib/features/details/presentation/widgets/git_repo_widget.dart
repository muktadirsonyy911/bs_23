import 'package:bs_23/core/extensions/date_extensions.dart';
import 'package:bs_23/core/services/internet_connectivity_service.dart';
import 'package:bs_23/core/widgets/global_widgets.dart';
import 'package:bs_23/features/home/domain/entities/git_repo_entity.dart';
import 'package:bs_23/features/home/presentation/controllers/home_controller.dart';
import 'package:bs_23/routes/app_pages.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GitRepoWidget extends GetWidget<HomeController> {
  final GitRepoEntity gitRepo;
  final int index;
  const GitRepoWidget({super.key, required this.gitRepo, required this.index});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        GestureDetector(
          onTap: () => controller.onRepoTap(gitRepo: gitRepo),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: GlobalWidgets.commonUi.getBoxDecoration(
              color: Get.theme.cardColor,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Container(
                      width: size.width * 0.2,
                      height: size.height * 0.18,
                      decoration: BoxDecoration(
                        color: Get.theme.primaryColor.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 6),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(DateTime.parse(gitRepo.updatedAt).toFormattedTime,
                                maxLines: 1,
                                style: Get.textTheme.bodySmall!.merge(
                                  TextStyle(color: Get.theme.primaryColor, height: 1.4),
                                ),
                                softWrap: false,
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.fade),
                            Text(DateTime.parse(gitRepo.updatedAt).toFormattedDay,
                                maxLines: 1,
                                style: Get.textTheme.headlineMedium!.merge(
                                  TextStyle(color: Get.theme.primaryColor, height: 1),
                                ),
                                softWrap: false,
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.fade),
                            Text(DateTime.parse(gitRepo.updatedAt).toFormattedMonth,
                                maxLines: 1,
                                style: Get.textTheme.bodySmall!.merge(
                                  TextStyle(color: Get.theme.primaryColor, height: 1),
                                ),
                                softWrap: false,
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.fade),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Opacity(
                    opacity: 1,
                    child: Wrap(
                      runSpacing: 10,
                      alignment: WrapAlignment.start,
                      children: <Widget>[
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                gitRepo.name,
                                style: Get.textTheme.headlineSmall,
                                maxLines: 3,
                                // textAlign: TextAlign.end,
                              ),
                            ),
                          ],
                        ),
                        const Divider(height: 8, thickness: 1),
                        Row(
                          children: [
                            Icon(
                              Icons.person_pin_circle_rounded,
                              size: 18,
                              color: Get.theme.focusColor,
                            ),
                            const SizedBox(width: 5),
                            Flexible(
                              child: Text(
                                gitRepo.ownerName,
                                maxLines: 1,
                                overflow: TextOverflow.fade,
                                softWrap: false,
                                style: Get.textTheme.bodyLarge,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.stars_sharp,
                              size: 18,
                              color: Get.theme.focusColor,
                            ),
                            const SizedBox(width: 5),
                            Flexible(
                              child: Text(
                                gitRepo.starCount.toString(),
                                maxLines: 1,
                                overflow: TextOverflow.fade,
                                softWrap: false,
                                style: Get.textTheme.bodyLarge,
                              ),
                            ),
                          ],
                        ),
                        const Divider(height: 8, thickness: 1),
                        Text(
                          gitRepo.description ?? '',
                          maxLines: 1,
                          overflow: TextOverflow.fade,
                          softWrap: false,
                          style: Get.textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        if (index == controller.gitRepoList.length - 1 &&
            controller.isLoading.isTrue &&
            Get.find<InternetConnectivityService>().connectionType != ConnectivityResult.none)
          SizedBox(
            height: size.height * 0.2,
            width: size.width,
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(bottom: 8.0),
                  child: Center(child: CircularProgressIndicator()),
                ),
                SizedBox(
                  height: size.height * 0.1,
                )
              ],
            ),
          )
      ],
    );
  }
}
