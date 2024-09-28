abstract class NewRealEstateEvent {
  /// No Params
  factory NewRealEstateEvent.backToListCategories() = BackToListCategoriesEvent;

  factory NewRealEstateEvent.pickLocation() = PickLocationEvent;

  factory NewRealEstateEvent.fetchRegion() = FetchRegionEvent;

  factory NewRealEstateEvent.fetchDataNew() = FetchDataNewEvent;

  /// Params
  factory NewRealEstateEvent.selectCity({
    required String city,
  }) = SelectCityEvent;

  factory NewRealEstateEvent.selectRegion({
    required String region,
  }) = SelectRegionEvent;
}

/// No Params
class BackToListCategoriesEvent implements NewRealEstateEvent {
  BackToListCategoriesEvent();
}

class PickLocationEvent implements NewRealEstateEvent {
  PickLocationEvent();
}

class FetchRegionEvent implements NewRealEstateEvent {
  FetchRegionEvent();
}

class FetchDataNewEvent implements NewRealEstateEvent {
  FetchDataNewEvent();
}

/// Params
class SelectCityEvent implements NewRealEstateEvent {
  final String city;

  SelectCityEvent({
    required this.city,
  });
}

class SelectRegionEvent implements NewRealEstateEvent {
  final String region;

  SelectRegionEvent({
    required this.region,
  });
}
