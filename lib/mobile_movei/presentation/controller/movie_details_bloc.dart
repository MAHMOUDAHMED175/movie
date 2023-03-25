import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movei_api/core/utils/enums.dart';
import 'package:movei_api/mobile_movei/domain/entities/movie_details.dart';
import 'package:movei_api/mobile_movei/domain/entities/recommendation.dart';
import 'package:movei_api/mobile_movei/domain/usecases/get_details_usecase.dart';
import 'package:movei_api/mobile_movei/domain/usecases/get_recommendation_usecase.dart';

part 'movie_details_event.dart';

part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  MovieDetailsBloc(this.getMovieDetails, this.recommendationUsecase)
      : super(const MovieDetailsState()) {
    on<GetMovieDetailsEvent>(_getMovieDetails);
    on<GetMovieRecommendationEvent>(_getRecommend);
  }

  final GetMovieDetails getMovieDetails;
  final RecommendationUsecase recommendationUsecase;

  FutureOr<void> _getMovieDetails(
      GetMovieDetailsEvent event, Emitter<MovieDetailsState> emit) async {
    final result =
        await getMovieDetails(GetDetailsParameters(intMovie: event.id));

    result.fold(
      (l) => emit(
        state.copyWith(
          movieDetailsState: RequestState.error,
          movieDetailsMessage: l.message,
        ),
      ),
      (r) => state.copyWith(
        movieDetailsState: RequestState.loading,
        movieDetails: r,
      ),
    );
  }

  FutureOr<void> _getRecommend(GetMovieRecommendationEvent event,
      Emitter<MovieDetailsState> emit) async {
    final result =
        await recommendationUsecase(ParametersRecommendation(event.id));

    result.fold(
      (l) => emit(
        state.copyWith(
          movieRecomendationState: RequestState.error,
          movieRecommendationMessage: l.message,
        ),
      ),
      (r) => state.copyWith(
        movieRecomendationState: RequestState.loading,
        movieRecommendation: r,
      ),
    );
  }
}
