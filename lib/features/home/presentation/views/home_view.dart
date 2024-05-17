import 'package:bs_23/core/extensions/date_extensions.dart';
import 'package:bs_23/core/services/internet_connectivity_service.dart';
import 'package:bs_23/routes/app_pages.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({super.key});

  final Size size = Get.size;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: size.height,
            width: size.width,
            child: Align(
              alignment: Alignment.topCenter,
              child: Container(
                height: size.height*0.3,
                width: size.width,
                decoration:  BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: const [
                        0.2,
                        0.9,
                      ],
                      colors: [
                        Get.theme.primaryColorDark,
                        Get.theme.primaryColorDark.withOpacity(0.1),
                      ],
                    )),
              ),
            ),
          ),


          Positioned(
            top: size.height*0.12,

            child: Container(
              height: size.height,
              width: size.width,
              decoration:  BoxDecoration(
                color: context.theme.cardColor,
                borderRadius: const BorderRadius.only(topRight: Radius.circular(30), topLeft: Radius.circular(30)),
              ),
              child: Obx(() {
                if (controller.gitRepoDataLoaded.isTrue) {
                  return ListView.builder(
                    controller: controller.scrollController,
                    itemCount: controller.gitRepoList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          GestureDetector(
                            onTap: ()
                            {
                              Get.toNamed(Routes.details,arguments:controller.gitRepoList[index] );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.1),
                                      spreadRadius: 1,
                                      blurRadius: 7,
                                      offset: const Offset(0, 1), // changes position of shadow
                                    ),
                                  ]
                              ),
                              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    children: [

                                      Container(
                                        width: size.width*0.2,
                                        height: size.height*0.18,
                                        decoration: BoxDecoration(
                                          color: Get.theme.primaryColor.withOpacity(0.2),
                                          borderRadius:  BorderRadius.circular(10),
                                        ),
                                        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 6),
                                        child: Center(
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                  DateTime.parse(controller.gitRepoList[index].updatedAt).toFormattedTime,
                                                  maxLines: 1,
                                                  style: Get.textTheme.bodySmall!.merge(
                                                    TextStyle(color: Get.theme.primaryColor, height: 1.4),
                                                  ),
                                                  softWrap: false,
                                                  textAlign: TextAlign.center,
                                                  overflow: TextOverflow.fade),
                                              Text(    DateTime.parse(controller.gitRepoList[index].updatedAt).toFormattedDay,
                                                  maxLines: 1,
                                                  style: Get.textTheme.headlineMedium!.merge(
                                                    TextStyle(color: Get.theme.primaryColor, height: 1),
                                                  ),
                                                  softWrap: false,
                                                  textAlign: TextAlign.center,
                                                  overflow: TextOverflow.fade),
                                              Text(    DateTime.parse(controller.gitRepoList[index].updatedAt).toFormattedMonth,
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
                                                  controller.gitRepoList[index].name,
                                                  style: Get.textTheme.headlineSmall,
                                                  maxLines: 3,
                                                  // textAlign: TextAlign.end,
                                                ),
                                              ),
                                            ],
                                          ),
                                          const Divider(height: 8, thickness: 0.1),
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
                                                  controller.gitRepoList[index].ownerName,
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
                                                  controller.gitRepoList[index].starCount.toString(),
                                                  maxLines: 1,
                                                  overflow: TextOverflow.fade,
                                                  softWrap: false,
                                                  style: Get.textTheme.bodyLarge,
                                                ),
                                              ),
                                            ],
                                          ),
                                          const Divider(height: 8, thickness: 0.1),
                                          Text(
                                            controller.gitRepoList[index].description??'',
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
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
                              height: size.height*0.2,
                              width:size.width,
                              child: Column(
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(bottom: 8.0),
                                    child: Center(child: CircularProgressIndicator()),
                                  ),
                                  SizedBox(
                                    height: size.height*0.1,

                                  )
                                ],
                              ),
                            )
                        ],
                      );
                    },
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(
                    ),
                  );
                }
              }),
            ),
          ),




        ],
      ),
    );

  }
}
