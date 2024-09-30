import 'package:bayti/source/global_widgets/app_icon_widget.dart';
import 'package:bayti/source/global_widgets/app_text_widget.dart';
import 'package:flutter/material.dart';

import '../core/values/export/export_values.dart';

class AppBottomBarWidget extends StatelessWidget {
  final List<AppTabBarItem> items;
  final int selectedIndex;
  final void Function(int) onTap;
  final bool isBottomIndicator;

  const AppBottomBarWidget({
    super.key,
    required this.items,
    required this.selectedIndex,
    required this.onTap,
    this.isBottomIndicator = false,
  }) : assert(items.length <= 5);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ...items.asMap().map(
          (int index, AppTabBarItem item) {
            return MapEntry(
              index, // Important
              InkWell(
                onTap: () {
                  onTap(index);
                },
                child: index == selectedIndex

                    // style active tab
                    ? AnimatedContainer(
                        duration: const Duration(
                          milliseconds: AppConstants.duration150,
                        ),

                        width: AppDimensions.width160,

                        // Padding for inner Container
                        padding: const EdgeInsetsDirectional.symmetric(
                          horizontal: AppDimensions.paddingOrMargin8,
                          vertical: AppDimensions.paddingOrMargin10,
                        ),

                        // Style container
                        decoration: BoxDecoration(
                          //color: AppColors.primary.withOpacity(0.15),
                          color:
                              Theme.of(context).brightness == Brightness.light
                                  ? AppColors.containerTab
                                  : AppColors.darkContainerTab,
                          borderRadius: BorderRadiusDirectional.circular(
                            AppDimensions.radius10,
                          ),
                        ),

                        // style tab icon & text
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Icon
                            if (item.icon != null)
                              AppIconWidget(
                                iconPath: item.icon,
                                color: Theme.of(context).primaryColor,
                                size: AppDimensions.iconSize22,
                              ),

                            // space
                            const SizedBox(
                              width: AppDimensions.width08,
                            ),

                            // Text
                            if (item.text != null)
                              AppTextWidget(
                                item.text ?? AppConstants.emptyText,
                                maxLines: AppConstants.maxLines,
                                textColor: AppColors.primary,
                                fontSize: AppDimensions.fontSize10,
                                // textStyle:
                                //     Theme.of(context).textTheme.displayMedium,
                              ),
                          ],
                        ),
                      )

                    // style non-active tab
                    : Row(
                        children: [
                          //icon
                          AppIconWidget(
                            iconPath: item.icon,
                            color: AppColors.onPrimaryContainer.withOpacity(
                              AppConstants.opacity_06,
                            ),
                            size: AppDimensions.iconSize20,
                          ),

                          // space
                          const SizedBox(
                            width: AppDimensions.width08,
                          ),

                          // Text
                          AppTextWidget(
                            item.text ?? AppConstants.emptyText,
                            maxLines: AppConstants.maxLines,
                            textColor: AppColors.gray03,
                            fontSize: AppDimensions.fontSize09,
                            // textStyle: Theme.of(context).textTheme.titleSmall,
                          ),
                        ],
                      ),
              ),
            );
          },
        ).values,
      ],
    );
  }
}

class AppTabBarItem {
  final String? text;
  final String? icon;

  AppTabBarItem({
    this.text,
    this.icon,
  });
}
