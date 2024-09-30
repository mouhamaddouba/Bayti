abstract class NewRealEstateEvent {
  /// No Params
  factory NewRealEstateEvent.backToListCategories() = BackToListCategoriesEvent;

  factory NewRealEstateEvent.pickLocation() = PickLocationEvent;

  factory NewRealEstateEvent.getCity() = GetCityEvent;

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

class GetCityEvent implements NewRealEstateEvent {
  GetCityEvent();
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
