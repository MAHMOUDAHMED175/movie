import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movei_api/core/error/failure.dart';
import 'package:movei_api/core/usecase/base_usecase.dart';
import 'package:movei_api/mobile_movei/domain/entities/movie_details.dart';
import 'package:movei_api/mobile_movei/domain/repository/base_movie_repository.dart';

class GetMovieDetails extends BaseUseCase<MovieDetails, GetDetailsParameters> {
  final BaseMovieRepository baseMovieRepository;

  GetMovieDetails(this.baseMovieRepository);

  @override
  Future<Either<Failure, MovieDetails>> call(GetDetailsParameters parameters) async {
    return await baseMovieRepository.getDetails(parameters);
  }
}

class GetDetailsParameters extends Equatable {
  final int intMovie;

  const GetDetailsParameters({required this.intMovie});

  @override
  List<Object> get props => [intMovie];
}

