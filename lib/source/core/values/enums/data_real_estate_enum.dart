import 'package:bayti/source/core/values/app_strings.dart';
import 'package:get/get.dart';

class DataRealEstateEnum {
  /// Type of transaction data
  List<String> get typeOfTransactionData => [
        AppStrings.selling.tr,
        AppStrings.rent.tr,
        AppStrings.mortgage.tr,
      ];

  /// Home direction data
  List<String> get homeDirectionData => [
        AppStrings.east.tr,
        AppStrings.north.tr,
        AppStrings.west.tr,
        AppStrings.south.tr,
      ];

  /// Type of Real estate data
  List get typeOfRealEstate => [
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

  /// Number of room data
  List<String> get numberOfRoomData {
    final numberOfRoomList = <String>[];

    for (int i = 1; i <= 25; i++) {
      numberOfRoomList.add(i.toString());
    }
    return numberOfRoomList;
  }

  /// Floor data
  List<String> get floorData {
    final floorList = <String>[];

    for (int i = -2; i <= 25; i++) {
      floorList.add(i.toString());
    }
    return floorList;
  }

  /// House Cladding data
  List<String> get houseCladdingData => [
        AppStrings.centerCladding.tr,
        AppStrings.goodCladding.tr,
        AppStrings.superCladding.tr,
      ];

  /// House Building data
  List<String> get houseBuildingData => [
        AppStrings.newBuilding.tr,
        AppStrings.oldBuilding.tr,
        AppStrings.underConstructionBuilding.tr,
      ];

  /// Void Type data
  List<String> get voidTypeData => [
        AppStrings.tabo.tr,
        AppStrings.hokum.tr,
        AppStrings.association.tr,
        AppStrings.akeed.tr,
      ];
}
