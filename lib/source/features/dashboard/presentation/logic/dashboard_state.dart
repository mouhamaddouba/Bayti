import 'package:bayti/source/features/dashboard_favorite/presentation/ui/dashboard_favorite_page.dart';
import 'package:bayti/source/features/dashboard_notification/presentation/ui/dashboard_notification_page.dart';
import 'package:bayti/source/features/dashboard_offers_expired/presentation/ui/dashboard_offers_expired_page.dart';
import 'package:bayti/source/features/dashboard_real_estate/presentation/ui/dashboard_real_estate_page.dart';
import 'package:get/get.dart';

class DashboardState {
  final int selectedIndex;
  final List<GetView> pagesAdmin;
  final List<GetView> pagesCustom;

  DashboardState({
    required this.selectedIndex,
    required this.pagesAdmin,
    required this.pagesCustom,
  });

  DashboardState.defaultObj()
      : this(
          selectedIndex: 0,
          pagesAdmin: <GetView>[
            const DashboardRealEstatePage(),
            const DashboardFavoritePage(),
            const DashboardOffersExpiredPage(),
          ],
          pagesCustom: <GetView>[
            const DashboardRealEstatePage(),
            const DashboardFavoritePage(),
            const DashboardNotificationPage(),
          ],
        );

  DashboardState copyWith({
    int? selectedIndex,
    List<GetView>? pagesAdmin,
    List<GetView>? pagesCustom,
  }) =>
      DashboardState(
        selectedIndex: selectedIndex ?? this.selectedIndex,
        pagesAdmin: pagesAdmin ?? this.pagesAdmin,
        pagesCustom: pagesCustom ?? this.pagesCustom,
      );
}
