import 'package:bayti/source/core/error/failures.dart';
import 'package:bayti/source/core/use_case/use_case.dart';
import 'package:bayti/source/features/new_real_estate/data/models/remote/response/city_data_response_dto.dart';
import 'package:bayti/source/features/new_real_estate/domain/repositories/new_real_estate_repo.dart';
import 'package:dartz/dartz.dart';

class GetCityUseCase extends UseCase<CityDataResponseDto, GetCityParams> {
  final NewRealEstateRepo _repository;

  GetCityUseCase({
    required NewRealEstateRepo repository,
  }) : _repository = repository;

  @override
  Future<Either<Failure, CityDataResponseDto>> call(GetCityParams params) {
    return _repository.getCity();
  }
}

class GetCityParams {
  GetCityParams();
}
