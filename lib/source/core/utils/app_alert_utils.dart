import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:bayti/source/core/values/app_colors.dart';
import 'package:bayti/source/core/values/app_strings.dart';
import 'package:bayti/source/core/values/app_dimensions.dart';
import 'package:bayti/source/global_widgets/app_button_widget.dart';
import 'package:bayti/source/core/values/constants/app_constants.dart';
import 'package:bayti/source/global_widgets/app_default_dialog_widget.dart';

abstract class AppAlertUtils {
  static void showSnackBar({
    required String title,
    required String message,
    Color backgroundColor = AppColors.primary,
    SnackPosition snackPosition = SnackPosition.BOTTOM,
    int durationSeconds = AppConstants.duration05,
  }) {
    Get.snackbar(
      title,
      message,
      duration: Duration(
        seconds: durationSeconds,
      ),
      borderRadius: AppDimensions.radius10,
      snackPosition: snackPosition,
      backgroundColor: backgroundColor,
      margin: const EdgeInsets.all(
        AppDimensions.paddingOrMargin8,
      ),
      titleText: Text(
        title,
        style: const TextStyle(
          fontSize: AppDimensions.fontSize10,
          color: AppColors.white01,
          fontWeight: FontWeight.w400,
        ),
      ),
      messageText: Text(
        message,
        style: const TextStyle(
          fontSize: AppDimensions.fontSize09,
          color: AppColors.white01,
        ),
      ),
    );
  }

  static void showDialog({
    String title = AppStrings.alert,
    String message = AppConstants.emptyText,
    Widget? icon,
    DialogTypeEnum dialogTypeEnum = DialogTypeEnum.primary,
    String? textConfirm = AppStrings.ok,
    String? textCancel = AppStrings.cancel,
    Widget? content,
    double? height,
    bool barrierDismissible = true,
    TextAlign? textAlign,
    List<AppButtonWidget> actionButtons = const [],
    Function()? onConfirm,
    Function()? onCancel,
    Function(dynamic)? onAfter,
  }) {
    Get.dialog(
      AppDefaultDialogWidget(
        textConfirm: textConfirm,
        title: title.tr,
        message: message,
        height: height,
        textAlign: textAlign,
        icon: icon,
        dialogTypeEnum: dialogTypeEnum,
        content: content,
        actionButtons: actionButtons,
        onConfirm: onConfirm,
        onCancel: onCancel,
      ),
      barrierDismissible: true,
    ).then((value) {
      if (onAfter != null) {
        onAfter(value);
      }
    });
  }
}
