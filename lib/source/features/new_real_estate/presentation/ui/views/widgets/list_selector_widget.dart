import 'package:bayti/source/core/values/app_colors.dart';
import 'package:bayti/source/core/values/app_dimensions.dart';
import 'package:bayti/source/features/new_real_estate/presentation/logic/new_real_estate_controller.dart';
import 'package:bayti/source/features/new_real_estate/presentation/ui/views/widgets/selector_container_widget.dart';
import 'package:bayti/source/global_widgets/app_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ListSelectorWidget<T> extends GetView<NewRealEstateController> {
  final String title;
  final List<T> items;
  final T groupValue;
  final ValueChanged<T> onChanged;

  const ListSelectorWidget({
    required this.title,
    required this.items,
    required this.groupValue,
    required this.onChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: AppDimensions.paddingOrMargin10,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Title of List
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppDimensions.paddingOrMargin16,
            ),
            child: AppTextWidget(
              title,
              textColor: AppColors.black01,
              fontSize: AppDimensions.fontSize09.sp,
            ),
          ),

          /// Space
          const SizedBox(
            height: AppDimensions.height16,
          ),

          /// List View Selector
          SizedBox(
            height: AppDimensions.height40,
            child: ListView.builder(
              itemCount: items.length,
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                /// Container selector
                return SelectorContainerWidget(
                  value: items[index],
                  groupValue: groupValue,
                  items: items,
                  onChanged: onChanged,
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
