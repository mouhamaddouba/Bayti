// ignore_for_file: must_be_immutable

import 'package:bayti/source/core/values/app_colors.dart';
import 'package:bayti/source/core/values/app_dimensions.dart';
import 'package:bayti/source/core/values/constants/app_constants.dart';
import 'package:bayti/source/global_widgets/app_icon_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextFieldWidget extends StatelessWidget {
  final String labelText;
  final String hintText;
  final List<TextInputFormatter>? inputFormatters;
  final FormFieldValidator<String>? validator;
  final TextEditingController? controller;
  final TextInputAction textInputAction;
  final TextInputType? keyboardType;
  TextEditingController? textController;
  String text; // Initialized in build
  final double fontSize;
  final FontWeight fontWeight;
  final int? minLines;
  final int? maxLines;
  final bool obscureText;
  final bool readOnly;
  final bool enabled;
  final TextAlign textAlign;
  final ValueChanged<String>? onChanged;
  final bool focused;
  final Color textColor;
  final Color backgroundColor;
  final double radius;
  final Widget? suffixIcon;
  final void Function()? onSuffixIconTap;
  final IconData? suffixIconData;
  final String? suffixIconPath;
  final Color suffixIconColor;
  final Widget? prefixIcon;
  final void Function()? onPrefixIconTap;
  final IconData? prefixIconData;
  final String? prefixIconPath;
  final Color prefixIconColor;
  double horizontalPadding;
  double verticalPadding;
  final double? height;
  final double? width;
  final String? initialValue;
  final int? maxLenght;
  final dynamic Function()? onEditingComplete;

  AppTextFieldWidget({
    super.key,
    required this.labelText,
    required this.hintText,
    this.validator,
    this.inputFormatters,
    this.controller,
    this.keyboardType,
    this.textInputAction = TextInputAction.next,
    this.textController,
    this.text = '',
    this.fontSize = AppDimensions.fontSize12,
    this.fontWeight = FontWeight.normal,
    this.minLines = 1,
    this.maxLines,
    this.obscureText = false,
    this.readOnly = false,
    this.enabled = true,
    this.textAlign = TextAlign.start,
    this.onChanged,
    this.focused = false,
    this.textColor = AppColors.black00,
    this.backgroundColor = AppColors.onLight500,
    this.radius = AppDimensions.radius10,
    this.suffixIcon,
    this.onSuffixIconTap,
    this.suffixIconData,
    this.suffixIconPath,
    this.suffixIconColor = AppColors.iconLight,
    this.prefixIcon,
    this.onPrefixIconTap,
    this.prefixIconData,
    this.prefixIconPath,
    this.prefixIconColor = AppColors.iconLight,
    this.horizontalPadding = AppDimensions.paddingOrMargin16,
    this.verticalPadding = AppDimensions.zero,
    this.height = AppDimensions.height50,
    this.width,
    this.initialValue,
    this.maxLenght,
    this.onEditingComplete,
  });

  final _border = const OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(
        AppDimensions.paddingOrMargin8,
      ),
    ),
    borderSide: BorderSide(
      color: AppColors.gray02,
      width: 1.4,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimensions.paddingOrMargin16,
        vertical: AppDimensions.paddingOrMargin8,
      ),
      child: SizedBox(
        width: width ?? MediaQuery.of(context).size.width / 1.09,
        child: TextFormField(
          onEditingComplete: onEditingComplete,
          maxLength: maxLenght,
          initialValue: initialValue,
          textInputAction: textInputAction,
          controller: controller,
          inputFormatters: inputFormatters,
          validator: validator,
          keyboardType: keyboardType,
          style: TextStyle(
            color: AppColors.gray03,
            fontSize: AppDimensions.fontSize09.sp,
            fontWeight: FontWeight.w400,
          ),
          decoration: InputDecoration(
            labelText: labelText,
            hintText: hintText,
            errorStyle: const TextStyle(
              color: AppColors.error,
            ),
            labelStyle: TextStyle(
              color: AppColors.gray03,
              fontSize: AppDimensions.fontSize09.sp,
              fontWeight: FontWeight.w400,
            ),
            hintStyle: TextStyle(
              color: AppColors.gray02,
              fontSize: AppDimensions.fontSize09.sp,
              fontWeight: FontWeight.w400,
            ),
            floatingLabelBehavior: FloatingLabelBehavior.auto,
            isDense: true,
            border: _border,
            enabledBorder: _border,
            focusedBorder: _border.copyWith(
              borderSide: const BorderSide(
                color: AppColors.primary,
                width: AppConstants.border0_5,
              ),
            ),
            errorBorder: _border,
            focusedErrorBorder: _border,
            suffixIcon: _getSuffixIconWidget(),
          ),
        ),
      ),
    );
  }

  Widget? _getSuffixIconWidget() {
    return suffixIconData != null || suffixIconPath != null
        ? AppIconWidget(
            onTap: onSuffixIconTap,
            iconData: suffixIconData,
            iconPath: suffixIconPath,
            color: suffixIconColor,
          )
        : suffixIcon;
  }
}
