import 'package:bayti/source/core/values/app_strings.dart';
import 'package:get/get.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

abstract class NewRealEstateRemoteDatasource {
  Future<List<ParseObject>> getCity();
  Future<List<ParseObject>> getRegionsByCityIds(
    List<String> cityIds,
  );
}

class NewRealEstateRemoteDatasourceImpl
    implements NewRealEstateRemoteDatasource {
  /// Get city
  @override
  Future<List<ParseObject>> getCity() async {
    final QueryBuilder<ParseObject> city = QueryBuilder<ParseObject>(
      ParseObject('City'),
    );
    final ParseResponse response = await city.query();

    if (response.success && response.results != null) {
      return response.results!.cast<ParseObject>();
    } else {
      throw Exception(
        AppStrings.failedToGetCity.tr,
      );
    }
  }

  /// Get Region by id the city
  @override
  Future<List<ParseObject>> getRegionsByCityIds(List<String> cityIds) async {
    final QueryBuilder<ParseObject> regionQuery = QueryBuilder<ParseObject>(
      ParseObject('Region'),
    )..whereContainedIn('cityId', cityIds);

    final ParseResponse response = await regionQuery.query();

    if (response.success && response.results != null) {
      return response.results!.cast<ParseObject>();
    } else {
      throw Exception(
        AppStrings.failedToGetRegions.tr,
      );
    }
  }
}
