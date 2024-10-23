import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:reelproject/Controllers/HomeController.dart';
import 'package:reelproject/Utils/Widgets/CachedNetworkImageWidget.dart';
import 'package:url_launcher/url_launcher.dart';

class BannerWidget extends GetView<HomeController> {
  const BannerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: controller,
        builder: (controller) {
          return Column(
            children: [
              CarouselSlider.builder(
                itemCount: controller.bannerModel?.data?.length ?? 0,
                options: CarouselOptions(
                  height: 60.h,
                  onPageChanged: (index, reason) {},
                  // aspectRatio: 8 / 1,
                  initialPage: 0,
                  padEnds: false,
                  // enlargeCenterPage: true,
                  viewportFraction: 1,
                  autoPlay: true,
                ),
                itemBuilder: (context, index, realIndex) =>
                    controller.bannerModel?.data?.isNotEmpty ?? false
                        ? InkWell(
                            onTap: () async {
                              if (await canLaunchUrl(Uri.parse(
                                  controller.bannerModel?.data?[index].url ??
                                      ''))) {
                                await launchUrl(
                                    Uri.parse(controller
                                            .bannerModel?.data?[index].url ??
                                        ''),
                                    mode: LaunchMode.externalApplication);
                              } else {
                                print("Error in Link");
                                print(controller.bannerModel?.data?[index].url);
                              }
                            },
                            child: CachedNetworkImageWidget(
                              width: double.maxFinite,
                              fit: BoxFit.fill,
                              image:
                                  controller.bannerModel?.data?[index].image ??
                                      '',
                            ),
                          )
                        : SizedBox.shrink(),
              ),
            ],
          );
        });
    // Column(
    //   children: [
    //     CarouselSlider(
    //       items: imageSliders,
    //       carouselController: _controller,
    //       options: CarouselOptions(
    //         height: 130.h,
    //         autoPlay: true,
    //         viewportFraction: 1,
    //         enlargeCenterPage: true,
    //       ),
    //     ),
    //     5.verticalSpace,
    //     Row(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       children: imgList.asMap().entries.map((entry) {
    //         return GestureDetector(
    //           onTap: () => _controller.animateToPage(entry.key),
    //           child: Container(
    //             width: 12.h,
    //             height: 12.h,
    //             margin:
    //                 const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
    //             decoration: const BoxDecoration(
    //                 shape: BoxShape.circle, color: Colors.white),
    //           ),
    //         );
    //       }).toList(),
    //     ),
    //   ],
    // );
  }
}
