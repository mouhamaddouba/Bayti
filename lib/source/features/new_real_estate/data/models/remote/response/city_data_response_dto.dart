import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

class CityDataResponseDto {
  final List<ParseObject> cityData;
  final List<String> cityName;

  CityDataResponseDto({
    required this.cityData,
    required this.cityName,
  });
}
