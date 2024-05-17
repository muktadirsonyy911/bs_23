import 'package:bs_23/core/styles/app_colors.dart';
import 'package:bs_23/core/utils/url_launch_helper.dart';
import 'package:bs_23/core/widgets/common_app_bar_widget.dart';
import 'package:bs_23/core/widgets/global_widgets.dart';
import 'package:bs_23/core/widgets/image_widget.dart';
import 'package:bs_23/features/details/presentation/controllers/details_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailsView extends GetView<DetailsController> {
  DetailsView({super.key});

  final Size size = Get.size;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CommonAppBarWidget(title: "Details"),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Image.asset(
                      'assets/images/git.png',
                      height: size.width * 0.06,
                      width: size.width * 0.06,
                    ),
                    SizedBox(
                      width: size.width * 0.01,
                    ),
                    Expanded(
                      child: Text(
                        'Github/App/#${controller.gitRepo.id}',
                        style: Get.textTheme.headlineSmall!.merge(TextStyle(color: Get.theme.disabledColor)),
                        maxLines: 3,
                        // textAlign: TextAlign.end,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                Text(
                  controller.gitRepo.name.capitalizeFirst ?? '',
                  style: Get.textTheme.headlineLarge!.merge(TextStyle(
                    color: Get.theme.textTheme.titleLarge!.color,
                    fontWeight: FontWeight.bold,
                  )),
                  maxLines: 3,
                  // textAlign: TextAlign.end,
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                Row(
                  children: [
                    GlobalWidgets.commonUi.customSmallBox(
                      size: size.height * 0.1,
                      height: size.width * 0.08,
                      radius: 5,
                      color: Get.theme.primaryColorLight,
                      child: Row(
                        children: [
                          Icon(
                            Icons.stars_sharp,
                            color: Get.theme.disabledColor,
                          ),
                          Text(
                            controller.gitRepo.starCount.toString(),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: size.width * 0.01,
                    ),
                    GlobalWidgets.commonUi.customSmallBox(
                      size: size.height * 0.1,
                      height: size.width * 0.08,
                      radius: 5,
                      color: Get.theme.primaryColorLight,
                      child: const Text(
                        '#flutter',
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                const Divider(height: 8, thickness: 1),
                SizedBox(
                  height: size.height * 0.01,
                ),
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Get.theme.primaryColorDark.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: ImageWidget(
                          imageUrl: controller.gitRepo.ownerPhoto ?? '',
                          height: size.width * 0.15,
                          width: size.width * 0.15,
                          imageBoxFit: 'cover',
                        ),
                      ),
                    ),
                    SizedBox(
                      width: size.width * 0.03,
                    ),
                    SizedBox(
                      width: size.width*0.75,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            controller.gitRepo.ownerName.capitalizeFirst ?? '',
                            style: Get.textTheme.titleLarge,
                            maxLines: 4,
                          ),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          GestureDetector(
                            onTap: ()
                            {
                              UrlLaunchHelper.urlLaunchHelper.urlLauncher(controller.gitRepo.ownerGit);
                            },
                            child:  GlobalWidgets.commonUi.customSmallBox(
                              size: size.height * 0.1,
                              height: size.width * 0.08,
                              radius: 5,

                              color: Get.theme.primaryColorLight,
                              child: Row(
                                children: [
                                  Image.asset(
                                    'assets/images/logo.png',
                                    height: size.width * 0.06,
                                    width: size.width * 0.06,
                                  ),
                                  SizedBox(
                                    width: size.width * 0.02,
                                  ),
                                  const Text(
                                    'Github',
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Text(
                  'Description',
                  style: Get.textTheme.headlineMedium!.merge(TextStyle(
                    color: Get.theme.textTheme.titleMedium!.color,
                    fontWeight: FontWeight.bold,
                  )),
                  maxLines: 3,
                  // textAlign: TextAlign.end,
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                const Divider(height: 8, thickness: 1),
                SizedBox(
                  height: size.height * 0.01,
                ),
                Text(
                  controller.gitRepo.description ?? '',
                  style: Get.textTheme.bodySmall,
                  textAlign: TextAlign.justify,
                  // textAlign: TextAlign.end,
                ),
              ],
            ),
          ),
        ),

        floatingActionButton:
        FloatingActionButton.extended(
          onPressed:(){
            UrlLaunchHelper.urlLaunchHelper.urlLauncher(controller.gitRepo.url);
          },
          backgroundColor: AppColors.blue,
          label: const Text('View Repository'),
          icon: Image.asset(
            'assets/images/logo.png',
            height: size.width * 0.06,
            width: size.width * 0.06,
          ),
        )
    );
  }
}
