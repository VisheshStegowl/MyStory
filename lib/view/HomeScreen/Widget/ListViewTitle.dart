import 'package:flutter/material.dart';
import 'package:reelproject/Utils/Styling/AppColors.dart';
import 'package:reelproject/Utils/Widgets/AppTextWidget.dart';

class ListViewTitle extends StatelessWidget {
  final String title;
  const ListViewTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        AppTextWidget(
          txtTitle: "My Stories",
          fontWeight: FontWeight.w700,
          txtColor: AppColors.grey.withOpacity(0.5),
          fontSize: 10,
        ),
        Flexible(
          child: AppTextWidget(
            textAlign: TextAlign.center,
            txtTitle: title,
            fontSize: 14,
            fontWeight: FontWeight.w900,
            txtColor: AppColors.white,
          ),
        ),
        AppTextWidget(
          txtTitle: "My Reels",
          fontWeight: FontWeight.w700,
          txtColor: AppColors.grey.withOpacity(0.5),
          fontSize: 10,
        ),
      ],
    );
  }
}
