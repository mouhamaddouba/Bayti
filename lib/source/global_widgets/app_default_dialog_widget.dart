// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/utils.dart';
import 'package:bayti/source/core/values/app_colors.dart';
import 'package:bayti/source/core/values/app_dimensions.dart';
import 'package:bayti/source/core/values/app_strings.dart';
import 'package:bayti/source/global_widgets/app_button_widget.dart';
import 'package:bayti/source/global_widgets/app_icon_widget.dart';
import 'package:bayti/source/global_widgets/app_text_widget.dart';

class AppDefaultDialogWidget extends StatelessWidget {
  final String title;
  List<Widget> actionButtons;
  final Widget? icon;
  final DialogTypeEnum dialogTypeEnum;
  final String message;
  final String? textConfirm;
  final Widget? content;
  final TextAlign? textAlign;
  final double? height;
  final Color? confirmTextColor;
  final Function()? onConfirm;
  final Function()? onCancel;

  AppDefaultDialogWidget({
    super.key,
    required this.title,
    this.actionButtons = const [],
    this.icon,
    this.dialogTypeEnum = DialogTypeEnum.primary,
    this.message = AppStrings.alertMassageNoContentText,
    this.content,
    this.textConfirm,
    this.confirmTextColor,
    this.height,
    this.onConfirm,
    this.onCancel,
    this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    actionButtons = actionButtons.isEmpty
        ? [
            // Cancel
            onCancel != null
                ? AppButtonWidget(
                    text: AppStrings.cancel.tr,
                    onPressed: onCancel,
                    width: AppDimensions.width100,
                    textColor: AppColors.primary,
                    //AppColors.black02,
                    fontSize: AppDimensions.fontSize10,
                    color: AppColors.white01,
                  )
                : const SizedBox.shrink(),

            // Space
            if (onCancel != null && onConfirm != null)
              const SizedBox(
                width: AppDimensions.paddingOrMargin16,
              ),

            // Confirm
            onConfirm != null
                ? AppButtonWidget(
                    text: textConfirm ?? AppStrings.ok.tr,
                    onPressed: onConfirm,
                    width: AppDimensions.width100,
                    textColor: Theme.of(context).brightness == Brightness.light
                        ? AppColors.whiteBlue
                        : AppColors.darkOnPrimaryContainer,
                    fontSize: AppDimensions.fontSize10,
                    color: _getPrimaryColor(context),
                  )
                : const SizedBox.shrink(),
          ]
        : actionButtons;

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          AppDimensions.radius16,
        ),
      ),
      elevation: AppDimensions.elevation04,
      child: ClipRRect(
        borderRadius: const BorderRadius.all(
          Radius.circular(
            AppDimensions.radius16,
          ),
        ),
        child: Container(
          color: AppColors.white01,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppDimensions.paddingOrMargin30,
              vertical: AppDimensions.paddingOrMargin16,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                // Icon
                (icon != null)
                    ? icon!
                    : AppIconWidget(
                        iconData: _getIconData(),
                        color: _getPrimaryColor(context),
                        size: AppDimensions.iconSize40,
                      ),

                // Space
                const SizedBox(
                  height: AppDimensions.paddingOrMargin16,
                ),

                // Title
                AppTextWidget(
                  title,
                  textAlign: TextAlign.center,
                  fontSize: AppDimensions.fontSize10,
                  fontWeight: FontWeight.w400,
                  textColor: AppColors.darkSurfaceVariant,
                ),

                // Space
                const SizedBox(
                  height: AppDimensions.paddingOrMargin10,
                ),

                // Content
                (content != null)
                    ? content!
                    : SingleChildScrollView(
                        child: AppTextWidget(
                          message.tr,
                          height: height,
                          textAlign: textAlign ?? TextAlign.center,
                          fontSize: AppDimensions.fontSize10,
                          fontWeight: FontWeight.w400,
                          textColor: AppColors.darkBackground,
                          maxLines: 20,
                        ),
                      ),

                // Space
                const SizedBox(
                  height: AppDimensions.paddingOrMargin16,
                ),

                // Action Buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: actionButtons,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  IconData _getIconData() {
    if (dialogTypeEnum == DialogTypeEnum.error) {
      return Icons.warning;
    } else if (dialogTypeEnum == DialogTypeEnum.warning) {
      return Icons.warning;
    } else if (dialogTypeEnum == DialogTypeEnum.success) {
      return Icons.check;
    } else {
      return Icons.check;
    }
  }

  Color _getPrimaryColor(BuildContext context) {
    if (dialogTypeEnum == DialogTypeEnum.error) {
      return AppColors.errorLight;
    } else if (dialogTypeEnum == DialogTypeEnum.warning) {
      return AppColors.warningLight;
    } else if (dialogTypeEnum == DialogTypeEnum.success) {
      return AppColors.successLight;
    } else {
      return Theme.of(context).primaryColor;
    }
  }
}

enum DialogTypeEnum {
  primary,
  success,
  warning,
  error,
}
