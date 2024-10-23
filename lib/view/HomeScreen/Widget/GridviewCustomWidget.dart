import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:focus_on_it/focus_on_it.dart';
import 'package:get/get.dart';
import 'package:reelproject/Utils/Models/ReelMainModel.dart';
import 'package:reelproject/Utils/Styling/AppColors.dart';
import 'package:reelproject/Utils/Widgets/AppTextWidget.dart';
import 'package:reelproject/Utils/Widgets/CachedNetworkImageWidget.dart';
import 'package:reelproject/view/HomeScreen/Widget/MyVideoWidget.dart';
import 'package:reelproject/view/ReelFullView/ReelFullView.dart';
import 'package:reels_viewer/reels_viewer.dart';

class GridViewCustomWidget extends StatefulWidget {
  final List<Reels> reels;
  final bool active;
  final String title;
  const GridViewCustomWidget({
    super.key,
    required this.reels,
    required this.active,
    required this.title,
  });

  @override
  State<GridViewCustomWidget> createState() => _GridViewCustomWidgetState();
}

class _GridViewCustomWidgetState extends State<GridViewCustomWidget> {
  final ScrollController _scrollController = ScrollController();
  late List<bool> _focusNodes;
  late List<ReelModel> reel;

  @override
  void initState() {
    super.initState();
    _focusNodes = List.generate(widget.reels.length, (_) => false);
    reel = widget.reels
        .map((e) => ReelModel(
            profileUrl: e.image.toString(),
            url: e.previewUrl.toString(),
            title: widget.title.toString(),
            userName: e.title.toString(),
            reelDescription: e.description.toString()))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: AppColors.error,
      constraints: BoxConstraints(maxHeight: 270.h),
      child: GridView.builder(
        padding: EdgeInsets.zero,
        itemCount: widget.reels.length, // Number of containers
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        controller: _scrollController,
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 500,
          mainAxisExtent: 175.w,
          // mainAxisSpacing: 10,crossAxisSpacing: 10
        ),
        itemBuilder: (context, index) {
          return FocusOnIt(
            onVisibilityGained: () {
              Future.delayed(const Duration(seconds: 3), () {
                if (mounted) {
                  setState(() {
                    _focusNodes[index] = true;
                  });
                }
              });
            },
            onVisibilityLost: () {
              if (mounted) {
                setState(() {
                  _focusNodes[index] = false;
                });
              }
            },
            child: InkWell(
              onTap: () {
                Get.to(() => ReelFullView(
                      reel: reel,
                      index: index,
                      title: widget.title,
                    ));
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: 250.h,
                    // Set a fixed height for each container
                    margin: const EdgeInsets.only(left: 10, right: 5),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.white,
                          strokeAlign: BorderSide.strokeAlignOutside),
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    alignment: Alignment.center,
                    child: widget.active && _focusNodes[index]
                        ? MyVideoWidget(
                            videoUrl: widget.reels[index].previewUrl ?? '',
                          )
                        : CachedNetworkImageWidget(
                            height: double.maxFinite,
                            width: double.maxFinite,
                            fit: BoxFit.contain,
                            image: widget.reels[index].image),
                  ),
                  5.verticalSpace,
                  Container(
                    constraints: BoxConstraints(maxHeight: 20.h),
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                        color: AppColors.darkgrey.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(10.r)),
                    padding: EdgeInsets.symmetric(vertical: 1.h),
                    margin: EdgeInsets.symmetric(horizontal: 5.w),
                    child: AppTextWidget(
                      maxLine: 2,
                      textAlign: TextAlign.center,
                      fontWeight: FontWeight.w600,
                      txtTitle: widget.reels[index].title.toString(),
                      txtColor: AppColors.white,
                      fontSize: 10,
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
