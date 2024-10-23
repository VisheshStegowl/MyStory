import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:reelproject/Utils/Styling/AppColors.dart';

/*
Changes : Interchanged suffix icon and suffix widget
 */
class AppTextFormField extends StatelessWidget {
  const AppTextFormField(
      {super.key,
      this.onChanged,
      this.hintTextColor = AppColors.black,
      this.maxLine = 1,
      this.label,
      required this.hintText,
      this.txtAlign = TextAlign.start,
      this.obscureText = false,
      this.suffixWidget,
      this.controller,
      this.focusNode,
      this.sideButton,
      this.validator,
      this.suffixStyle,
      this.suffixIcon,
      this.autoFocus = false,
      this.textInputAction = TextInputAction.go,
      this.textCapitalization = TextCapitalization.words,
      this.onEditingComplete,
      this.onFieldSubmitted,
      this.autoCorrect = false,
      this.isFilled,
      this.errorTxt,
      this.inputFormatters,
      this.keyboardType,
      this.fontSize = 12,
      this.fontWeight = FontWeight.w500,
      this.cursorColor,
      this.prefixIcon,
      this.expands = false,
      this.fillColor = AppColors.white,
      this.borderWidth = 1.0,
      this.borderStyle = BorderStyle.solid,
      this.readOnly = false,
      this.maxLength,
      this.contentPadding,
      this.isValid,
      this.textColor = AppColors.black,
      this.border,
      this.enabledBorder,
      this.focusedBorder,
      this.borderColor,
      this.ontapOutside,
      this.hintTextSize = 14});

  final Function(dynamic val)? onChanged;
  final String hintText;
  final double hintTextSize;
  final TextInputType? keyboardType;
  final Function()? onEditingComplete;
  final Function(String val)? onFieldSubmitted;
  final Function(PointerDownEvent val)? ontapOutside;
  final TextInputAction? textInputAction;
  final TextCapitalization textCapitalization;
  final TextAlign txtAlign;
  final bool obscureText;
  final bool autoCorrect;
  final String? label;
  final bool expands;
  final bool autoFocus;
  final bool? isFilled;
  final Widget? suffixWidget;
  final Widget? suffixIcon;
  final String? errorTxt;
  final TextStyle? suffixStyle;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final Widget? sideButton;
  final String? Function(String?)? validator;
  final double fontSize;
  final int? maxLength;
  final FontWeight fontWeight;
  final Color? cursorColor;
  final Color? hintTextColor;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? prefixIcon;
  final Color fillColor;
  final double borderWidth;
  final Color? borderColor;
  final BorderStyle borderStyle;
  final bool readOnly;
  final Color textColor;
  final EdgeInsets? contentPadding;
  final bool? isValid;
  final int? maxLine;
  final InputBorder? border;
  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      expands: expands,
      textAlign: txtAlign,
      enabled: !readOnly,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      focusNode: focusNode,
      autofocus: autoFocus,
      cursorColor: cursorColor,
      maxLength: maxLength,
      maxLines: maxLine,
      style: TextStyle(
          color: textColor,
          fontSize: fontSize.sp,
          fontWeight: fontWeight,
          overflow: TextOverflow.ellipsis),
      textInputAction: textInputAction,
      textCapitalization: textCapitalization,
      readOnly: readOnly,
      decoration: InputDecoration(
        
        counterText: "",
        enabledBorder: _getOutlineBorder(),
        border: _getOutlineBorder(),
        focusedBorder: _getOutlineFocuseBorder(),
        errorStyle: TextStyle(fontWeight: FontWeight.w600, fontSize: 12.sp),
        prefixIcon: isValid != null
            ? (isValid!
                ? const Icon(
                    Icons.check,
                    color: AppColors.success,
                  )
                : const Icon(
                    Icons.close,
                    color: AppColors.error,
                  ))
            : prefixIcon,
        contentPadding:
            contentPadding ?? EdgeInsets.only(top: 0, bottom: 15.h, left: 20.w),

        // isDense: true,
        errorText: errorTxt,
        icon: sideButton,
        suffix: suffixWidget, // previously it was suffixIcon
        suffixIcon: suffixIcon, // previously it was suffixWidget
        suffixStyle: suffixStyle,
        filled: true,
        alignLabelWithHint: true,
        hintText: hintText.tr,
        // label: AppTextWidget(
        //   txtTitle: label ?? hintText,
        //   fontSize: 12,
        //   txtColor: hintTextColor ?? AppColors.hintText,
        // ),
        // floatingLabelAlignment: FloatingLabelAlignment.start,
        // floatingLabelBehavior: FloatingLabelBehavior.auto,
        // hintText: hintText,
        hintStyle: TextStyle(
          
            color: hintTextColor ?? AppColors.black,
            fontSize: hintTextSize,
            fontWeight: FontWeight.w400),
        fillColor: fillColor,
      ),
      onChanged: onChanged,
      onEditingComplete: onEditingComplete,
      onFieldSubmitted: onFieldSubmitted,
      autocorrect: autoCorrect,
      validator: validator,
      inputFormatters: inputFormatters,
      onTapOutside: ontapOutside ??
          (value) {
            FocusScope.of(context).unfocus();
          },
    );
  }

  InputBorder _getOutlineBorder() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.r),
        borderSide: BorderSide(
            style: borderStyle,
            color: borderColor ?? AppColors.black.withOpacity(0.1),
            width: borderWidth));
  }

  InputBorder _getOutlineFocuseBorder() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.r),
        borderSide: BorderSide(
            style: borderStyle,
            color: borderColor ?? AppColors.black.withOpacity(0.1),
            width: borderWidth));
  }
}
