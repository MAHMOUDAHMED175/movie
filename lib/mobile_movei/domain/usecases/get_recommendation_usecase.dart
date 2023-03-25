import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movei_api/core/error/failure.dart';
import 'package:movei_api/core/usecase/base_usecase.dart';
import 'package:movei_api/mobile_movei/domain/entities/recommendation.dart';
import 'package:movei_api/mobile_movei/domain/repository/base_movie_repository.dart';

class RecommendationUsecase
    extends BaseUseCase<List<Recommendation>, ParametersRecommendation> {
  final BaseMovieRepository baseMovieRepository;

  RecommendationUsecase(this.baseMovieRepository);

  @override
  Future<Either<Failure, List<Recommendation>>> call(
      ParametersRecommendation parameters) async {
    return await baseMovieRepository.getRecommendation(parameters);
  }
}

class ParametersRecommendation extends Equatable {
  final int id;

  const ParametersRecommendation(this.id);

  @override
  List<Object> get props => [id];
}
