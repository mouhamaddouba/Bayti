import 'package:bayti/source/core/error/failures.dart';
import 'package:bayti/source/features/new_real_estate/data/models/remote/response/city_data_response_dto.dart';
import 'package:dartz/dartz.dart';

abstract class NewRealEstateRepo {
  Future<Either<Failure, CityDataResponseDto>> getCityWithRegion();
}
