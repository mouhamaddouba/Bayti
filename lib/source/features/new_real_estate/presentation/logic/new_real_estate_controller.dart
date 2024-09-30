// ignore_for_file: unnecessary_overrides, avoid_print

import 'package:bayti/source/core/values/constants/app_constants.dart';
import 'package:bayti/source/features/new_real_estate/domain/usecases/get_city_usecase.dart';
import 'package:bayti/source/features/new_real_estate/domain/usecases/get_regions_by_ids_usecase.dart';
import 'package:bayti/source/features/new_real_estate/presentation/logic/new_real_estate_event.dart';
import 'package:bayti/source/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:bayti/source/features/new_real_estate/presentation/logic/new_real_estate_state.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

class NewRealEstateController extends GetxController {
  ///region State

  final state = NewRealEstateState.defaultObj().obs;

  ///endregion State

  ///region Use Cases

  final GetCityUseCase _getCityUseCase;
  final GetRegionByIdsUseCase _getRegionByIdsUseCase;

  ///endregion Use Cases

  ///region Constructors

  NewRealEstateController({
    required GetCityUseCase getCityUseCase,
    required GetRegionByIdsUseCase getRegionByIdsUseCase,
  })  : _getCityUseCase = getCityUseCase,
        _getRegionByIdsUseCase = getRegionByIdsUseCase;

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

    _getCityEvent(
      event: GetCityEvent(),
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
    } else if (event is GetCityEvent) {
      _getCityEvent(
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
          latitudeValue: selectedPosition.latitude,
          longitudeValue: selectedPosition.longitude,
          location: selectedPosition,
        ),
      );
    }
  }

  /// Get City from Back4apps
  void _getCityEvent({
    required GetCityEvent event,
  }) async {
    state(
      state().copyWith(
        isLoading: true,
        isError: false,
      ),
    );

    final result = await _getCityUseCase.call(
      GetCityParams(),
    );

    result.fold(
      (failure) {
        state(
          state().copyWith(
            isError: true,
          ),
        );
      },
      (regions) {
        state().cityName.assignAll(regions.cityName);
        state().cityData.assignAll(regions.cityData as Iterable<ParseObject>);
      },
    );

    state(
      state().copyWith(
        isLoading: false,
      ),
    );
  }

  /// Select city from dropDown
  void _selectCityEvent({
    required SelectCityEvent event,
  }) async {
    state(
      state().copyWith(
        city: event.city,
        isFetchRegion: true,
      ),
    );

    final result = await _getRegionByIdsUseCase.call(
      GetRegionsParams(
        state: state.value,
      ),
    );

    result.fold(
      (failure) {
        state(
          state().copyWith(
            isError: true,
          ),
        );
      },
      (regions) {
        state().regionData.assignAll(regions
            .map((region) {
              return region.get<String>('region') ?? AppConstants.emptyText;
            })
            .toList()
            .obs);
      },
    );

    state(
      state().copyWith(
        isFetchRegion: false,
      ),
    );
  }

  /// Select region from dropDown
  void _selectRegionEvent({
    required SelectRegionEvent event,
  }) {
    state(
      state().copyWith(
        region: event.region,
      ),
    );
  }

  ///region Private functions for dealing with events

  ///endregion Private functions for dealing with events

  void _workers() {}

  void _processArguments() {}

  ///endregion Private functions
}
