import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movei_api/core/error/failure.dart';

abstract class BaseUseCase<Type, parameters> {
  Future<Either<Failure, Type>> call(parameters parameters);
}

class NoParameters extends Equatable {
  const NoParameters();

  @override
  List<Object> get props => [];
}

