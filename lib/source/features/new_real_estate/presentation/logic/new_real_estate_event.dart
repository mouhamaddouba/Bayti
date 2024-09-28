abstract class NewRealEstateEvent {
  /// No Params
  factory NewRealEstateEvent.backToListCategories() = BackToListCategoriesEvent;

  factory NewRealEstateEvent.pickLocation() = PickLocationEvent;

  /// Params
}

/// No Params
class BackToListCategoriesEvent implements NewRealEstateEvent {
  BackToListCategoriesEvent();
}

class PickLocationEvent implements NewRealEstateEvent {
  PickLocationEvent();
}

/// Params
