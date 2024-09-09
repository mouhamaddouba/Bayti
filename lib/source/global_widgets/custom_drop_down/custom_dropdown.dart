library animated_custom_dropdown;

export 'custom_dropdown.dart';

import 'package:bayti/source/core/values/app_colors.dart';
import 'package:bayti/source/core/values/app_dimensions.dart';
import 'package:bayti/source/core/values/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

part 'animated_section.dart';
part 'dropdown_field.dart';
part 'dropdown_overlay.dart';
part 'overlay_builder.dart';

enum SearchType { onListData }

class CustomDropdown extends StatefulWidget {
  final List<String> items;
  final TextEditingController controller;
  final String? hintText;
  final TextStyle? hintStyle;
  final TextStyle? selectedStyle;
  final String? errorText;
  final TextStyle? errorStyle;
  final TextStyle? listItemStyle;
  final BorderSide? borderSide;
  final BorderSide? errorBorderSide;
  final BorderRadius? borderRadius;
  final Widget? fieldSuffixIcon;
  final Function(String)? onChanged;
  final bool? excludeSelected;
  final Color? fillColor;
  final bool? canCloseOutsideBounds;
  final SearchType? searchType;

  CustomDropdown({
    super.key,
    required this.items,
    required this.controller,
    this.hintText,
    this.hintStyle,
    this.selectedStyle,
    this.errorText,
    this.errorStyle,
    this.listItemStyle,
    this.errorBorderSide,
    this.borderRadius,
    this.borderSide,
    this.fieldSuffixIcon,
    this.onChanged,
    this.excludeSelected = true,
    this.fillColor = AppColors.whiteBlue,
  })  : assert(items.isNotEmpty, 'Items list must contain at least one item.'),
        assert(
          controller.text.isEmpty || items.contains(controller.text),
          'Controller value must match with one of the item in items list.',
        ),
        searchType = null,
        canCloseOutsideBounds = true;

  CustomDropdown.search({
    super.key,
    required this.items,
    required this.controller,
    this.hintText,
    this.hintStyle,
    this.selectedStyle,
    this.errorText,
    this.errorStyle,
    this.listItemStyle,
    this.errorBorderSide,
    this.borderRadius,
    this.borderSide,
    this.fieldSuffixIcon,
    this.onChanged,
    this.excludeSelected = true,
    this.canCloseOutsideBounds = true,
    this.fillColor = Colors.white,
  })  : assert(items.isNotEmpty, 'Items list must contain at least one item.'),
        assert(
          controller.text.isEmpty || items.contains(controller.text),
          'Controller value must match with one of the item in items list.',
        ),
        searchType = SearchType.onListData;

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  final layerLink = LayerLink();

  @override
  Widget build(BuildContext context) {
    /// hint text
    final hintText = widget.hintText ?? 'Select value';

    // hint style :: if provided then merge with default
    final hintStyle = TextStyle(
      color: AppColors.gray03,
      fontSize: AppDimensions.fontSize09.sp,
      fontWeight: FontWeight.w400,
    ).merge(widget.hintStyle);

    // selected item style :: if provided then merge with default
    final selectedStyle = TextStyle(
      color: AppColors.black01,
      fontSize: AppDimensions.fontSize09.sp,
      fontWeight: FontWeight.w400,
    ).merge(widget.selectedStyle);

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimensions.paddingOrMargin16,
        vertical: AppDimensions.paddingOrMargin8,
      ),
      child: _OverlayBuilder(
        overlay: (size, hideCallback) {
          return _DropdownOverlay(
            items: widget.items,
            controller: widget.controller,
            size: size,
            layerLink: layerLink,
            hideOverlay: hideCallback,
            headerStyle:
                widget.controller.text.isNotEmpty ? selectedStyle : hintStyle,
            hintText: hintText,
            listItemStyle: widget.listItemStyle,
            excludeSelected: widget.excludeSelected,
            canCloseOutsideBounds: widget.canCloseOutsideBounds,
            searchType: widget.searchType,
          );
        },
        child: (showCallback) {
          return CompositedTransformTarget(
            link: layerLink,
            child: Container(
              height: AppDimensions.height50,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(
                  Radius.circular(
                    AppDimensions.paddingOrMargin10,
                  ),
                ),
                border: Border.all(
                  color: AppColors.gray02,
                  width: AppConstants.border1_2,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: AppDimensions.paddingOrMargin2,
                ),
                child: _DropDownField(
                  controller: widget.controller,
                  onTap: showCallback,
                  style: selectedStyle,
                  borderRadius: widget.borderRadius,
                  borderSide: widget.borderSide,
                  errorBorderSide: widget.errorBorderSide,
                  errorStyle: widget.errorStyle,
                  errorText: widget.errorText,
                  hintStyle: hintStyle,
                  hintText: hintText,
                  suffixIcon: widget.fieldSuffixIcon,
                  onChanged: widget.onChanged,
                  fillColor: widget.fillColor,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}