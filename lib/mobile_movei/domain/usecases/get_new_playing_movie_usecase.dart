



import 'package:dartz/dartz.dart';
import 'package:movei_api/core/usecase/base_usecase.dart';

import '../../../core/error/failure.dart';
import '../entities/movie.dart';
import '../repository/base_movie_repository.dart';

class GetNewPlayingMovie extends BaseUseCase<List<Movie>,NoParameters>{
  final BaseMovieRepository baseMovieRepository;

  GetNewPlayingMovie(this.baseMovieRepository);

  @override
  Future<Either<Failure,List<Movie>>>  call(NoParameters parameters)async{
    return await baseMovieRepository.getNowPlaying();
  }
}