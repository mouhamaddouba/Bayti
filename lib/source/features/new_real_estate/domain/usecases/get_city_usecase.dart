import 'package:bayti/source/core/error/failures.dart';
import 'package:bayti/source/core/use_case/use_case.dart';
import 'package:bayti/source/features/new_real_estate/data/models/remote/response/city_data_response_dto.dart';
import 'package:bayti/source/features/new_real_estate/domain/repositories/new_real_estate_repo.dart';
import 'package:dartz/dartz.dart';

class NewRealEstateUseCase extends UseCase<CityDataResponseDto, Params> {
  final NewRealEstateRepo _repository;

  NewRealEstateUseCase({
    required NewRealEstateRepo repository,
  }) : _repository = repository;

  @override
  Future<Either<Failure, CityDataResponseDto>> call(Params params) {
    return _repository.getCityWithRegion();
  }
}

class Params {
  Params();
}
