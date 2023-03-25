import 'package:dartz/dartz.dart';
import 'package:movei_api/core/error/failure.dart';
import 'package:movei_api/mobile_movei/domain/entities/movie.dart';
import 'package:movei_api/mobile_movei/domain/entities/movie_details.dart';
import 'package:movei_api/mobile_movei/domain/entities/recommendation.dart';
import 'package:movei_api/mobile_movei/domain/usecases/get_details_usecase.dart';
import 'package:movei_api/mobile_movei/domain/usecases/get_recommendation_usecase.dart';

import '../../../core/error/exeptions.dart';
import '../../domain/repository/base_movie_repository.dart';
import '../datasource/movie_remote_data_source.dart';

class MovieRepository extends BaseMovieRepository {
  final BaseMovieRemoteDataSource baseMovieRemoteDataSource;

  MovieRepository(this.baseMovieRemoteDataSource);

  @override
  Future<Either<Failure, List<Movie>>> getNowPlaying() async {
    try {
      final result = await baseMovieRemoteDataSource.getNowPlayingMovies();
      return right(result);
    } on ServerException catch (error) {
      return left(ServerFailure(error.errorMessageModel.status_message));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getPopularMovies() async {
    try {
      final result = await baseMovieRemoteDataSource.getPopularMovie();
      return right(result);
    } on ServerException catch (error) {
      return left(ServerFailure(error.errorMessageModel.status_message));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getTopRatedMovies() async {
    try {
      final result = await baseMovieRemoteDataSource.getTopRatedMovie();
      return right(result);
    } on ServerException catch (error) {
      return left(ServerFailure(error.errorMessageModel.status_message));
    }
  }

  @override
  Future<Either<Failure, MovieDetails>> getDetails(
      GetDetailsParameters parameters) async {
    try {
      final result =
          await baseMovieRemoteDataSource.getMovieDetails(parameters);
      return right(result);
    } on ServerException catch (error) {
      return left(ServerFailure(error.errorMessageModel.status_message));
    }
  }

  @override
  Future<Either<Failure, List<Recommendation>>> getRecommendation(ParametersRecommendation parameters) async {
    try {
      final result =
      await baseMovieRemoteDataSource.getRecommendation(parameters);
      return right(result);
    } on ServerException catch (error) {
      return left(ServerFailure(error.errorMessageModel.status_message));
    }
  }

}
