import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import 'package:bayti/source/core/error/failures.dart';

abstract class UseCase<T, P> {
  Future<Either<Failure, T>> call(P params);
}

class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}
