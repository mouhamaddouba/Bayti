abstract class DashboardRealEstateEvent {
  /// Without params
  factory DashboardRealEstateEvent.animateFloatButton() =
      AnimateFloatButtonEvent;

  factory DashboardRealEstateEvent.toNewRealEstate() = ToNewRealEstateEvent;

  /// with params
  factory DashboardRealEstateEvent.toListCategories({
    required String categories,
  }) = ToListCategoriesEvent;
}

/// Without Params
class AnimateFloatButtonEvent implements DashboardRealEstateEvent {
  AnimateFloatButtonEvent();
}

class ToNewRealEstateEvent implements DashboardRealEstateEvent {
  ToNewRealEstateEvent();
}

/// With params
class ToListCategoriesEvent implements DashboardRealEstateEvent {
  String categories;

  ToListCategoriesEvent({
    required this.categories,
  });
}
