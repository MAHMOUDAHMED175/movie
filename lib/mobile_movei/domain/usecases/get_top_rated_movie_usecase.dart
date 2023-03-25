



import 'package:dartz/dartz.dart';
import 'package:movei_api/core/usecase/base_usecase.dart';

import '../../../core/error/failure.dart';
import '../entities/movie.dart';
import '../repository/base_movie_repository.dart';

class GetTopRatedMovie extends BaseUseCase<List<Movie>,NoParameters>{
  final BaseMovieRepository baseMovieRepository;

  GetTopRatedMovie(this.baseMovieRepository);


  @override
// الميثود call دى متعرفه فالى اللغه نفسها والطريق دى اشمها callable وان ادام عملت instance من الكلاس فانا ممكن انفذ الميثود دايركت من غير مااستدعيها بمجرد مااعمل inctance
  Future<Either<Failure,List<Movie>>>  call(NoParameters parameters)async{
    return await baseMovieRepository.getTopRatedMovies();
  }
}




