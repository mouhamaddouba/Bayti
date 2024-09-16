import 'package:bayti/source/core/values/app_colors.dart';
import 'package:bayti/source/core/values/app_dimensions.dart';
import 'package:bayti/source/core/values/constants/app_constants.dart';
import 'package:bayti/source/features/new_real_estate/presentation/logic/new_real_estate_controller.dart';
import 'package:bayti/source/global_widgets/app_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SelectorContainerWidget<T> extends GetView<NewRealEstateController> {
  final T value;
  final T groupValue;
  final List<T> items;
  final ValueChanged<T> onChanged;

  const SelectorContainerWidget({
    super.key,
    required this.value,
    required this.groupValue,
    required this.items,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(
        start: value == AppDimensions.zero
            ? AppDimensions.paddingOrMargin16
            : AppDimensions.paddingOrMargin8,
        end: value == items.length - 1
            ? AppDimensions.paddingOrMargin16
            : AppDimensions.zero,
      ),
      child: InkWell(
        borderRadius: const BorderRadius.all(
          Radius.circular(
            AppDimensions.radius10,
          ),
        ),
        onTap: () {
          onChanged(value);
        },
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: AppDimensions.paddingOrMargin16,
          ),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(
                AppDimensions.paddingOrMargin12,
              ),
            ),
            border: Border.all(
              color: value == groupValue ? AppColors.primary : AppColors.gray02,
              width: value == groupValue
                  ? AppConstants.border1_5
                  : AppConstants.border1_2,
            ),
          ),
          child: Center(
            child: AppTextWidget(
              value.toString(),
              textColor:
                  value == groupValue ? AppColors.black01 : AppColors.gray03,
              fontSize: AppDimensions.fontSize08.sp,
            ),
          ),
        ),
      ),
    );
  }
}
