import 'package:flutter/material.dart';

import 'package:bayti/source/core/values/app_colors.dart';
import 'package:bayti/source/core/values/app_dimensions.dart';
import 'package:bayti/source/global_widgets/app_text_widget.dart';
import 'package:bayti/source/global_widgets/app_ripple_widget.dart';

class AppButtonWidget extends StatelessWidget {
  final String text;
  final double fontSize;
  final double? width;
  final double? height;
  final double? radius;
  final Function()? onPressed;
  final Color color;
  final Color textColor;
  final bool isBordered;
  final bool isSelectedBorder;
  final bool disabled;
  final Widget? icon;

  const AppButtonWidget({
    super.key,
    required this.text,
    this.fontSize = AppDimensions.fontSize10,
    this.width,
    this.height = AppDimensions.height55,
    this.radius = AppDimensions.radius10,
    this.isBordered = false,
    this.isSelectedBorder = false,
    required this.onPressed,
    required this.color,
    this.textColor = AppColors.white01,
    this.disabled = false,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return AppRippleWidget(
      onTap: disabled ? () => {} : onPressed,
      child: Ink(
        width: width,
        height: height ?? AppDimensions.height40,
        decoration: BoxDecoration(
          border: Border.all(
            color: color,
            width: AppDimensions.thickness01,
          ),
          color: _getColor(),
          borderRadius: BorderRadius.circular(
            radius ?? AppDimensions.radius10,
          ),
        ),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppDimensions.paddingOrMargin10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Icon
                icon != null ? icon! : const SizedBox.shrink(),

                // Space
                SizedBox(
                  width: icon != null
                      ? AppDimensions.paddingOrMargin16
                      : AppDimensions.zero,
                ),

                // Text
                AppTextWidget(
                  text,
                  textColor: _getTextColor(),
                  fontSize: fontSize,
                  fontWeight: FontWeight.w700,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Color _getColor() {
    if (isBordered) {
      return disabled ? AppColors.onLight300 : textColor;
    }
    return disabled ? AppColors.onLight300 : color;
  }

  Color _getTextColor() {
    if (isBordered) {
      return disabled ? AppColors.onLight300 : color;
    }
    return disabled ? AppColors.onLight300 : textColor;
  }
}
