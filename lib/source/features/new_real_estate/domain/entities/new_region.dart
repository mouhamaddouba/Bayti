class NewRegion {
  final String objectId;
  final String region;
  final String cityId;

  NewRegion({
    required this.objectId,
    required this.region,
    required this.cityId,
  });

  @override
  String toString() {
    return objectId;
  }
}
