import 'package:bayti/source/core/values/app_colors.dart';
import 'package:bayti/source/core/values/app_dimensions.dart';
import 'package:bayti/source/core/values/app_strings.dart';
import 'package:bayti/source/core/values/constants/app_constants.dart';
import 'package:bayti/source/features/location/presentation/logic/location_controller.dart';
import 'package:bayti/source/features/location/presentation/logic/location_event.dart';
import 'package:bayti/source/global_widgets/app_icon_widget.dart';
import 'package:bayti/source/global_widgets/app_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationPage extends GetView<LocationController> {
  final bool isGetMyLocation;

  const LocationPage({
    super.key,
    this.isGetMyLocation = true,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          /// Text Location
          Padding(
            padding: const EdgeInsetsDirectional.only(
              end: AppDimensions.paddingOrMargin16,
            ),
            child: AppTextWidget(
              withBackground: true,
              backgroundRadius: AppDimensions.radius10,
              AppStrings.selectLocation.tr,
              textColor: AppColors.white01,
              fontSize: AppDimensions.fontSize09.sp,
              fontWeight: FontWeight.w600,
              onTap: () {
                controller.on(
                  event: LocationEvent.setLocation(),
                );
              },
            ),
          ),
        ],
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          /// Google Map
          GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: const CameraPosition(
              target: AppConstants.syriaLatLng,
              zoom: 18.4746,
            ),
            markers: controller.state().markers,
            liteModeEnabled: false,
            onMapCreated: (GoogleMapController mapController) {
              controller.state().completer.complete(mapController);
              controller.state().completerController.complete(mapController);
              if (isGetMyLocation == true) {
                controller.on(
                  event: LocationEvent.getUserLocation(),
                );
              }
            },
            mapToolbarEnabled: false,
            zoomControlsEnabled: false,
            myLocationButtonEnabled: false,
            myLocationEnabled: controller.state().isMyLocationEnabled,
          ),

          /// Marker
          const Center(
            child: AppIconWidget(
              iconData: Icons.location_pin,
              color: AppColors.red01,
              size: AppDimensions.iconSize36,
            ),
          )
        ],
      ),
    );
  }
}
