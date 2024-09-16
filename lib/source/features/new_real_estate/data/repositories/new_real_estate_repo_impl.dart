import 'package:bayti/source/features/new_real_estate/data/datasource/new_real_estate_remote_datasource.dart';
import 'package:bayti/source/features/new_real_estate/domain/repositories/new_real_estate_repo.dart';

class NewRealEstateRepoImpl implements NewRealEstateRepo {
  final NewRealEstateRemoteDatasource _remoteDatasource;

  NewRealEstateRepoImpl({
    required NewRealEstateRemoteDatasource remoteDatasource,
  }) : _remoteDatasource = remoteDatasource;
}
