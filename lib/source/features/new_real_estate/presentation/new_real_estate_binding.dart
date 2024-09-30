import 'package:bayti/source/features/new_real_estate/data/datasource/new_real_estate_remote_datasource.dart';
import 'package:bayti/source/features/new_real_estate/data/repositories/new_real_estate_repo_impl.dart';
import 'package:bayti/source/features/new_real_estate/domain/usecases/new_real_estate_usecase.dart';
import 'package:bayti/source/features/new_real_estate/presentation/logic/new_real_estate_controller.dart';
import 'package:get/get.dart';

class NewRealEstateBinding extends Bindings {
  @override
  void dependencies() {
    final cityWithRegion = NewRealEstateRepoImpl(
      remoteDatasource: NewRealEstateRemoteDatasourceImpl(),
    );

    final getCityWithRegionUseCase = NewRealEstateUseCase(
      repository: cityWithRegion,
    );

    Get.lazyPut(
      () => NewRealEstateController(
        getCityWithRegionUseCase: getCityWithRegionUseCase,
      ),
    );
  }
}
