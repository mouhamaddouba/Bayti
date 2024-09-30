import 'package:bayti/source/core/error/failures.dart';
import 'package:bayti/source/core/use_case/use_case.dart';
import 'package:bayti/source/features/new_real_estate/domain/repositories/new_real_estate_repo.dart';
import 'package:bayti/source/features/new_real_estate/presentation/logic/new_real_estate_state.dart';
import 'package:dartz/dartz.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

class GetRegionByIdsUseCase
    extends UseCase<List<ParseObject>, GetRegionsParams> {
  final NewRealEstateRepo _repository;

  GetRegionByIdsUseCase({
    required NewRealEstateRepo repository,
  }) : _repository = repository;

  @override
  Future<Either<Failure, List<ParseObject>>> call(
    GetRegionsParams params,
  ) {
    return _repository.getRegionsByCityIds(
      params.state,
    );
  }
}

class GetRegionsParams {
  final NewRealEstateState state;

  GetRegionsParams({
    required this.state,
  });
}
