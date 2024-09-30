import 'package:bayti/source/core/error/exceptions.dart';
import 'package:bayti/source/core/error/failures.dart';
import 'package:bayti/source/core/utils/app_network_utils.dart';
import 'package:bayti/source/core/values/constants/app_constants.dart';
import 'package:bayti/source/features/new_real_estate/data/datasource/new_real_estate_remote_datasource.dart';
import 'package:bayti/source/features/new_real_estate/data/models/remote/response/city_data_response_dto.dart';
import 'package:bayti/source/features/new_real_estate/domain/repositories/new_real_estate_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

class NewRealEstateRepoImpl implements NewRealEstateRepo {
  final NewRealEstateRemoteDatasource _remoteDatasource;

  NewRealEstateRepoImpl({
    required NewRealEstateRemoteDatasource remoteDatasource,
  }) : _remoteDatasource = remoteDatasource;

  @override
  Future<Either<Failure, CityDataResponseDto>> getCityWithRegion() async {
    try {
      if (await AppNetworkUtilsImpl.instance.isConnected) {
        final List<ParseObject> cityData =
            await _remoteDatasource.getCityWithRegion();

        final List<String> cityName = cityData.map((parseObject) {
          return parseObject.get<String>('city') ?? AppConstants.emptyText;
        }).toList();

        return Right(
          CityDataResponseDto(
            cityData: cityData,
            cityName: cityName,
          ),
        );
      }
      return Left(
        NoInternetConnectionFailure(),
      );
    } on ServerException catch (exception) {
      return Left(
        ServerFailure(
          message: exception.message,
        ),
      );
    } on LocalException catch (exception) {
      return Left(
        LocalFailure(
          message: exception.message,
        ),
      );
    }
  }
}
