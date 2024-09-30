import 'package:bayti/source/core/values/app_strings.dart';
import 'package:get/get.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

abstract class NewRealEstateRemoteDatasource {
  Future<List<ParseObject>> getCityWithRegion();
}

class NewRealEstateRemoteDatasourceImpl
    implements NewRealEstateRemoteDatasource {
  @override
  Future<List<ParseObject>> getCityWithRegion() async {
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
}
