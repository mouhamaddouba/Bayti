class NewRegionResponseDto {
  final String objectId;
  final String region;
  final String cityId;

  NewRegionResponseDto({
    required this.objectId,
    required this.region,
    required this.cityId,
  });

  factory NewRegionResponseDto.fromJson(
    Map<String, dynamic> json,
  ) =>
      NewRegionResponseDto(
        objectId: json['objectId'],
        region: json['region'],
        cityId: json['cityId'],
      );
}
