import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

class NewRealEstateState {
  final bool isLoading;
  final bool isSaveButtonPress;

  final bool isFetchRegion;
  final RxList<String> cityName;
  final RxList<String> regionData;
  final TextEditingController cityDropDownController;
  final TextEditingController regionDropDownController;

  final TextEditingController priceFieldController;
  final TextEditingController spaceFieldController;
  final TextEditingController phoneFieldController;
  final TextEditingController detailsFieldController;

  final String typeOfTransactionValue;
  final List<String> homeDirectionValue;
  final List<dynamic> typeOfRealEstateValue;
  final bool showTextField;
  final bool showSelector;
  final TextEditingController recordNumberFieldController;
  final TextEditingController roomsDropDownController;
  final TextEditingController floorDropDownController;
  final String houseCladdingValue;
  final String houseBuildingValue;
  final String voidTypeValue;
  List<File> images;
  final Uint8List videoThumbnail;

  final double latitudeValue;
  final double longitudeValue;
  final LatLng location;

  final String city;
  final String region;
  final RxList<ParseObject> cityData;
  final List<dynamic> suggestions;
  final bool isError;

  NewRealEstateState({
    required this.isLoading,
    required this.isSaveButtonPress,
    required this.isFetchRegion,
    required this.cityName,
    required this.regionData,
    required this.cityDropDownController,
    required this.regionDropDownController,
    required this.priceFieldController,
    required this.spaceFieldController,
    required this.phoneFieldController,
    required this.detailsFieldController,
    required this.typeOfTransactionValue,
    required this.homeDirectionValue,
    required this.typeOfRealEstateValue,
    required this.showTextField,
    required this.showSelector,
    required this.recordNumberFieldController,
    required this.roomsDropDownController,
    required this.floorDropDownController,
    required this.houseCladdingValue,
    required this.houseBuildingValue,
    required this.voidTypeValue,
    required this.images,
    required this.videoThumbnail,
    required this.latitudeValue,
    required this.longitudeValue,
    required this.location,
    required this.city,
    required this.region,
    required this.cityData,
    required this.suggestions,
    required this.isError,
  });

  NewRealEstateState.defaultObj()
      : this(
          isLoading: false,
          isSaveButtonPress: false,
          isFetchRegion: true,
          cityName: <String>[].obs,
          regionData: <String>[].obs,
          cityDropDownController: TextEditingController(),
          regionDropDownController: TextEditingController(),
          priceFieldController: TextEditingController(),
          spaceFieldController: TextEditingController(),
          phoneFieldController: TextEditingController(),
          detailsFieldController: TextEditingController(),
          typeOfTransactionValue: '',
          homeDirectionValue: [],
          typeOfRealEstateValue: [],
          showTextField: false,
          showSelector: false,
          recordNumberFieldController: TextEditingController(),
          roomsDropDownController: TextEditingController(),
          floorDropDownController: TextEditingController(),
          houseCladdingValue: '',
          houseBuildingValue: '',
          voidTypeValue: '',
          images: [],
          videoThumbnail: Uint8List(0),
          latitudeValue: 36.20059287559827,
          longitudeValue: 37.141430244674815,
          location: const LatLng(36.20059287559827, 37.141430244674815),
          city: '',
          region: '',
          cityData: <ParseObject>[].obs,
          suggestions: [],
          isError: false,
        );

  NewRealEstateState copyWith({
    bool? isLoading,
    bool? isSaveButtonPress,
    bool? isFetchRegion,
    RxList<String>? cityName,
    RxList<String>? regionData,
    TextEditingController? cityDropDownController,
    TextEditingController? regionDropDownController,
    TextEditingController? priceFieldController,
    TextEditingController? spaceFieldController,
    TextEditingController? phoneFieldController,
    TextEditingController? detailsFieldController,
    String? typeOfTransactionValue,
    List<String>? homeDirectionValue,
    List<dynamic>? typeOfRealEstateValue,
    bool? showTextField,
    bool? showSelector,
    TextEditingController? recordNumberFieldController,
    TextEditingController? roomsDropDownController,
    TextEditingController? floorDropDownController,
    String? houseCladdingValue,
    String? houseBuildingValue,
    String? voidTypeValue,
    List<File>? images,
    Uint8List? videoThumbnail,
    double? latitudeValue,
    double? longitudeValue,
    LatLng? location,
    String? city,
    String? region,
    RxList<ParseObject>? cityData,
    List<dynamic>? suggestions,
    bool? isError,
  }) =>
      NewRealEstateState(
        isLoading: isLoading ?? this.isLoading,
        isSaveButtonPress: isSaveButtonPress ?? this.isSaveButtonPress,
        isFetchRegion: isFetchRegion ?? this.isFetchRegion,
        cityName: cityName ?? this.cityName,
        regionData: regionData ?? this.regionData,
        cityDropDownController:
            cityDropDownController ?? this.cityDropDownController,
        regionDropDownController:
            regionDropDownController ?? this.regionDropDownController,
        priceFieldController: priceFieldController ?? this.priceFieldController,
        spaceFieldController: spaceFieldController ?? this.spaceFieldController,
        phoneFieldController: phoneFieldController ?? this.phoneFieldController,
        detailsFieldController:
            detailsFieldController ?? this.detailsFieldController,
        typeOfTransactionValue:
            typeOfTransactionValue ?? this.typeOfTransactionValue,
        homeDirectionValue: homeDirectionValue ?? this.homeDirectionValue,
        typeOfRealEstateValue:
            typeOfRealEstateValue ?? this.typeOfRealEstateValue,
        showTextField: showTextField ?? this.showTextField,
        showSelector: showSelector ?? this.showSelector,
        recordNumberFieldController:
            recordNumberFieldController ?? this.recordNumberFieldController,
        roomsDropDownController:
            roomsDropDownController ?? this.roomsDropDownController,
        floorDropDownController:
            floorDropDownController ?? this.floorDropDownController,
        houseCladdingValue: houseCladdingValue ?? this.houseCladdingValue,
        houseBuildingValue: houseBuildingValue ?? this.houseBuildingValue,
        voidTypeValue: voidTypeValue ?? this.voidTypeValue,
        images: images ?? this.images,
        videoThumbnail: videoThumbnail ?? this.videoThumbnail,
        latitudeValue: latitudeValue ?? this.latitudeValue,
        longitudeValue: longitudeValue ?? this.longitudeValue,
        location: location ?? this.location,
        city: city ?? this.city,
        region: region ?? this.region,
        cityData: cityData ?? this.cityData,
        suggestions: suggestions ?? this.suggestions,
        isError: isError ?? this.isError,
      );
}
