import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:focus_on_it/focus_on_it.dart';
import 'package:get/get.dart';
import 'package:reelproject/Controllers/HomeController.dart';
import 'package:reelproject/Utils/Styling/AppColors.dart';
import 'package:reelproject/Utils/Widgets/AppLoder.dart';
import 'package:reelproject/Utils/Widgets/AppTextWidget.dart';
import 'package:reelproject/view/HomeScreen/Widget/BannerWidget.dart';
import 'package:reelproject/view/HomeScreen/Widget/GridviewCustomWidget.dart';
import 'package:reelproject/view/HomeScreen/Widget/ListViewTitle.dart';
import 'package:reelproject/view/ReelFullView/ReelFullView.dart';
import 'package:reels_viewer/reels_viewer.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  // final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Scaffold(
              // appBar: AppBar(
              //   toolbarHeight: 20,
              // ),
              backgroundColor: AppColors.black,
              extendBodyBehindAppBar: false,
              body: GetBuilder<HomeController>(
                  init: controller,
                  builder: (controller) {
                    return SingleChildScrollView(
                      controller: controller.scrollController,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          10.verticalSpace,
                          ListView.separated(
                              padding: EdgeInsets.zero,
                              physics: const BouncingScrollPhysics(),
                              separatorBuilder: (context, index) {
                                return controller.reelMainModel
                                            ?.categories?[index].reels !=
                                        []
                                    ? const BannerWidget()
                                    : SizedBox.shrink();
                              },
                              itemCount: controller.a.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return controller.reelMainModel
                                            ?.categories?[index].reels !=
                                        []
                                    ? Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          10.verticalSpace,
                                          ListViewTitle(
                                            title: controller.reelMainModel
                                                    ?.categories?[index].name
                                                    ?.toUpperCase() ??
                                                '',
                                          ),
                                          10.verticalSpace,
                                          FocusOnIt(
                                              key: ValueKey(index),
                                              onVisibilityGained: () {
                                                controller.previewVideo(index);
                                              },
                                              onVisibilityLost: () {
                                                controller
                                                    .noPreviewVideo(index);
                                              },
                                              child: GridViewCustomWidget(
                                                key: ValueKey(controller
                                                    .reelMainModel
                                                    ?.categories?[index]
                                                    .id),
                                                title: controller
                                                        .reelMainModel
                                                        ?.categories?[index]
                                                        .name ??
                                                    '',
                                                reels: controller
                                                        .reelMainModel
                                                        ?.categories?[index]
                                                        .reels ??
                                                    [],
                                                active: controller.a[index],
                                              )),
                                          10.verticalSpace,
                                          InkWell(
                                            onTap: () {
                                              List<ReelModel> reel = controller
                                                      .reelMainModel
                                                      ?.categories?[index]
                                                      .reels
                                                      ?.map((e) => ReelModel(
                                                          profileUrl: e.image
                                                              .toString(),
                                                          url: e.previewUrl
                                                              .toString(),
                                                          title: '',
                                                          userName: e.title
                                                              .toString(),
                                                          reelDescription: e
                                                              .description
                                                              .toString()))
                                                      .toList() ??
                                                  [];
                                              Get.to(() => ReelFullView(
                                                    reel: reel,
                                                    index: 0,
                                                    title: '',
                                                  ));
                                            },
                                            child: Container(
                                              constraints: BoxConstraints(
                                                  maxHeight: 20.h),
                                              width: double.maxFinite,
                                              decoration: BoxDecoration(
                                                  color: AppColors.darkgrey
                                                      .withOpacity(0.15),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.r)),
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 1.h),
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: 5.w),
                                              child: const AppTextWidget(
                                                maxLine: 2,
                                                textAlign: TextAlign.center,
                                                fontWeight: FontWeight.w600,
                                                txtTitle: "-- VIEW ALL --",
                                                txtColor: AppColors.white,
                                                fontSize: 10,
                                              ),
                                            ),
                                          ),
                                          10.verticalSpace,
                                        ],
                                      )
                                    : SizedBox.shrink();
                              }),
                        ],
                      ),
                    );
                  })),
          Obx(() => Visibility(
                visible: controller.isLoading.value,
                child: const AppLoder(),
              ))
        ],
      ),
    );
  }
}
