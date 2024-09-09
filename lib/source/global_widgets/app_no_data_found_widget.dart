import 'package:flutter/material.dart';

import 'package:bayti/source/core/values/app_dimensions.dart';
import 'package:bayti/source/global_widgets/app_text_widget.dart';
import 'package:bayti/source/global_widgets/app_image_widget.dart';

class AppNoDataFoundWidget extends StatelessWidget {
  final double? widthImage;
  final double? space;
  final String title;
  final String path;
  final MainAxisAlignment? mainAxisAlignment;

  const AppNoDataFoundWidget({
    super.key,
    this.widthImage,
    this.space,
    required this.title,
    required this.path,
    this.mainAxisAlignment,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.center,
      children: [
        AppImageWidget(
          path: path,
          width: widthImage ?? AppDimensions.width300,
        ),
        SizedBox(
          height: space ?? AppDimensions.height40,
        ),
        AppTextWidget(
          title,
          textStyle: Theme.of(context).textTheme.displaySmall,
        ),
      ],
    );
  }
}
