


import 'package:dartz/dartz.dart';
import 'package:movei_api/mobile_movei/domain/entities/movie.dart';
import 'package:movei_api/mobile_movei/domain/entities/movie_details.dart';
import 'package:movei_api/mobile_movei/domain/entities/recommendation.dart';
import 'package:movei_api/mobile_movei/domain/usecases/get_details_usecase.dart';
import 'package:movei_api/mobile_movei/domain/usecases/get_recommendation_usecase.dart';

import '../../../core/error/failure.dart';

abstract class BaseMovieRepository{

   Future<Either<Failure,List<Movie>>> getNowPlaying();
   Future<Either<Failure,List<Movie>>> getPopularMovies();
   Future<Either<Failure,List<Movie>>> getTopRatedMovies();
   Future<Either<Failure,MovieDetails>> getDetails(GetDetailsParameters parameters);
   Future<Either<Failure,List<Recommendation>>> getRecommendation(ParametersRecommendation parameters);
}