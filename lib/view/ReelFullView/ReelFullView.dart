import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reelproject/Controllers/HomeController.dart';
import 'package:reelproject/Utils/Styling/AppColors.dart';
import 'package:reels_viewer/reels_viewer.dart';

class ReelFullView extends StatelessWidget {
  final List<ReelModel> reel;
  final int index;
  final String title;
  const ReelFullView({
    super.key,
    required this.reel,
    required this.index,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: Platform.isIOS ? false : true,
      child: ReelsViewer(
        primaryColor: AppColors.primary,
        showProgressIndicator: true,
        indexOnTaped: index,
        reelsList: reel,
        appbarTitle: title,
      ),
    );
  }
}
