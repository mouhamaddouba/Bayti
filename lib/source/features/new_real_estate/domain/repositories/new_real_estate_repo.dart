import 'package:bayti/source/core/error/failures.dart';
import 'package:bayti/source/features/new_real_estate/data/models/remote/response/city_data_response_dto.dart';
import 'package:bayti/source/features/new_real_estate/presentation/logic/new_real_estate_state.dart';
import 'package:dartz/dartz.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

abstract class NewRealEstateRepo {
  Future<Either<Failure, CityDataResponseDto>> getCity();
  Future<Either<Failure, List<ParseObject>>> getRegionsByCityIds(
    NewRealEstateState state,
  );
}
