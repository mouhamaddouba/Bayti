import 'package:bayti/source/core/values/app_strings.dart';
import 'package:bayti/source/core/values/constants/app_assets.dart';
import 'package:get/get.dart';

class RealEstateTypeEnum {
  List get titleRealEstat => [
        AppStrings.homes.tr,
        AppStrings.villas.tr,
        AppStrings.farms.tr,
        AppStrings.factory.tr,
        AppStrings.residentiaLands.tr,
        AppStrings.commercialLands.tr,
        AppStrings.shops.tr,
        AppStrings.warehouses.tr,
        AppStrings.specialOffers.tr,
      ];

  List get imageRealEstat => [
        AppAssets.homes,
        AppAssets.villas,
        AppAssets.farms,
        AppAssets.factory,
        AppAssets.residentiaLands,
        AppAssets.commercialLands,
        AppAssets.shops,
        AppAssets.warehouses,
        AppAssets.specialOffers,
      ];
}
