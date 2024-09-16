import 'package:bayti/source/core/values/app_hero.dart';
import 'package:bayti/source/core/values/constants/app_constants.dart';
import 'package:bayti/source/features/new_real_estate/presentation/logic/new_real_estate_controller.dart';
import 'package:bayti/source/features/new_real_estate/presentation/ui/views/new_real_estate_app_bar_view.dart';
import 'package:bayti/source/features/new_real_estate/presentation/ui/views/new_real_estate_buttons_view.dart';
import 'package:bayti/source/features/new_real_estate/presentation/ui/views/new_real_estate_fields_view.dart';
import 'package:bayti/source/features/new_real_estate/presentation/ui/views/new_real_estate_location_selector_view.dart';
import 'package:bayti/source/features/new_real_estate/presentation/ui/views/new_real_estate_media_view.dart';
import 'package:bayti/source/features/new_real_estate/presentation/ui/views/new_real_estate_selector_view.dart';
import 'package:bayti/source/global_widgets/app_loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewRealEstatePage extends GetView<NewRealEstateController> {
  const NewRealEstatePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: AppHero.floatButton,
      child: Obx(
        () {
          return Scaffold(
            body: controller.state().isLoading
                // State is Loading
                ? const Center(
                    child: AppLoadingWidget(),
                  )

                // State is success
                : const SingleChildScrollView(
                    child: Column(
                      children: [
                        /// Appbar
                        NewRealEstateAppBarView(),

                        ///  DropDowns
                        NewRealEstateLocationSelectorView(),

                        /// Text fields
                        NewRealEstateFieldsView(),

                        /// Selection field
                        NewRealEstateSelectorView(),

                        /// Select images and video
                        AppConstants.isAdmin
                            ? NewRealEstateMediaView()
                            : SizedBox.shrink(),

                        /// Button save
                        NewRealEstateButtonsView(),
                      ],
                    ),
                  ),
          );
        },
      ),
    );
  }
}
