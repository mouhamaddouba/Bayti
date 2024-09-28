// ignore_for_file: unnecessary_overrides, avoid_print

import 'package:bayti/source/features/new_real_estate/presentation/logic/new_real_estate_event.dart';
import 'package:bayti/source/routes/app_pages.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:bayti/source/features/new_real_estate/presentation/logic/new_real_estate_state.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

class NewRealEstateController extends GetxController {
  ///region State

  final state = NewRealEstateState.defaultObj().obs;

  ///endregion State

  ///region Use Cases

  ///endregion Use Cases

  ///region Constructors

  NewRealEstateController();

  ///endregion Constructors

  ///region Lifecycle

  @override
  InternalFinalCallback<void> get onStart {
    return super.onStart;
  }

  @override
  void onInit() {
    super.onInit();

    _workers();
    _processArguments();

    _fetchRegionEvent(
      event: FetchRegionEvent(),
    );

    _fetchDataNewEvent(
      event: FetchDataNewEvent(),
    );
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  @override
  InternalFinalCallback<void> get onDelete {
    return super.onDelete;
  }

  ///endregion Lifecycle

  ///region Public functions

  void on({
    required NewRealEstateEvent event,
  }) {
    if (event is BackToListCategoriesEvent) {
      _backToListCategoriesEvent(
        event: event,
      );
    } else if (event is PickLocationEvent) {
      _pickLocationEvent(
        event: event,
      );
    } else if (event is SelectCityEvent) {
      _selectCityEvent(
        event: event,
      );
    } else if (event is SelectRegionEvent) {
      _selectRegionEvent(
        event: event,
      );
    } else if (event is FetchRegionEvent) {
      _fetchRegionEvent(
        event: event,
      );
    } else if (event is FetchDataNewEvent) {
      _fetchDataNewEvent(
        event: event,
      );
    }
  }

  ///endregion Public functions

  ///region Private functions

  /// Back to real estate page
  void _backToListCategoriesEvent({
    required BackToListCategoriesEvent event,
  }) {
    Get.back();
  }

  /// Pick location [long , lat]
  void _pickLocationEvent({
    required PickLocationEvent event,
  }) async {
    final LatLng? selectedPosition = await Get.toNamed(
      AppRoutes.location,
    ) as LatLng?;

    if (selectedPosition != null) {
      state(
        state().copyWith(
          isSaveButtonPress: true,
        ),
      );
    }

    state(
      state().copyWith(
        latitudeValue: selectedPosition?.latitude,
        longitudeValue: selectedPosition?.longitude,
        location: selectedPosition,
      ),
    );
  }

  void _selectCityEvent({
    required SelectCityEvent event,
  }) async {
    state(
      state().copyWith(
        city: event.city,
        isFetchRegion: true,
        //regionController: state().regionDropDownController,
      ),
    );

    List listItemSelect = [];
    List items = [];

    final itemSelect = state().cityTable.where(
          (result) => result.get<String>('city') == state().city,
        );

    listItemSelect.assignAll(itemSelect);

    for (final item in listItemSelect) {
      items.add(item.get<String>('objectId'));
    }

    //fetch region
    final QueryBuilder<ParseObject> region = QueryBuilder<ParseObject>(
      ParseObject('Region'),
    )..whereContainedIn(
        'cityId',
        items,
      );

    final ParseResponse responseRegion = await region.query();

    if (responseRegion.success && responseRegion.results != null) {
      if (state().regionData.isEmpty) {
        for (final itemRegion in responseRegion.results!) {
          state().regionData.add(
                itemRegion.get<String>('region'),
              );
        }
      } else {
        state().regionData.clear();
        state(
          state().copyWith(
            regionData: state().regionData,
          ),
        );
        for (final itemRegion in responseRegion.results!) {
          state().regionData.add(
                itemRegion.get<String>('region'),
              );
        }
      }
    }

    state(
      state().copyWith(
        isFetchRegion: false,
      ),
    );
  }

  void _selectRegionEvent({
    required SelectRegionEvent event,
  }) {
    state(
      state().copyWith(
        region: event.region,
      ),
    );
  }

  void _fetchRegionEvent({
    required FetchRegionEvent event,
  }) async {
    final QueryBuilder<ParseObject> realEstatGet = QueryBuilder<ParseObject>(
      ParseObject('Region'),
    );

    final ParseResponse response = await realEstatGet.query();

    if (response.success && response.results != null) {
      final regions = response.results
          ?.map((result) => result.get<String>('region'))
          .whereType<String>()
          .toList();

      state().suggestions.assignAll(regions as Iterable<String>);
    } else {
      print('Error in fetch data suggestion');
    }
  }

  void _fetchDataNewEvent({
    required FetchDataNewEvent event,
  }) async {
    try {
      state(
        state().copyWith(
          isLoading: true,
          isError: false,
        ),
      );

      //fetch city
      final QueryBuilder<ParseObject> city = QueryBuilder<ParseObject>(
        ParseObject('City'),
      );

      final ParseResponse responseCity = await city.query();

      if (responseCity.success && responseCity.results != null) {
        for (final itemCity in responseCity.results!) {
          state().cityData.add(itemCity.get<String>('city'));
        }

        state()
            .cityTable
            .assignAll(responseCity.results! as Iterable<ParseObject>);
      }

      // print('ml');
      // print(state().cityTable);
      // final QueryBuilder<ParseObject> realEstatGet = QueryBuilder<ParseObject>(
      //   ParseObject('Region'),
      // );
    } catch (error) {
      state(
        state().copyWith(
          isError: true,
        ),
      );
    } finally {
      state(
        state().copyWith(
          isLoading: false,
        ),
      );
    }
  }

  ///region Private functions for dealing with events

  ///endregion Private functions for dealing with events

  void _workers() {}

  void _processArguments() {}

  ///endregion Private functions
}
