import 'package:bayti/source/features/new_real_estate/data/datasource/new_real_estate_remote_datasource.dart';
import 'package:bayti/source/features/new_real_estate/data/repositories/new_real_estate_repo_impl.dart';
import 'package:bayti/source/features/new_real_estate/domain/usecases/get_city_usecase.dart';
import 'package:bayti/source/features/new_real_estate/domain/usecases/get_regions_by_ids_usecase.dart';
import 'package:bayti/source/features/new_real_estate/presentation/logic/new_real_estate_controller.dart';
import 'package:get/get.dart';

class NewRealEstateBinding extends Bindings {
  @override
  void dependencies() {
    final cityRepository = NewRealEstateRepoImpl(
      remoteDatasource: NewRealEstateRemoteDatasourceImpl(),
    );

    final getCityUseCase = GetCityUseCase(
      repository: cityRepository,
    );

    final getRegionByIdsUseCase = GetRegionByIdsUseCase(
      repository: cityRepository,
    );

    Get.lazyPut(
      () => NewRealEstateController(
        getCityUseCase: getCityUseCase,
        getRegionByIdsUseCase: getRegionByIdsUseCase,
      ),
    );
  }
}
