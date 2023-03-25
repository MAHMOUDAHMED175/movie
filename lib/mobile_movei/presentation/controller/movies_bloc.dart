import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movei_api/core/usecase/base_usecase.dart';
import 'package:movei_api/core/utils/dummy.dart';
import 'package:movei_api/core/utils/enums.dart';
import 'package:movei_api/mobile_movei/domain/entities/movie.dart';
import 'package:movei_api/mobile_movei/presentation/controller/movies_event.dart';
import 'package:movei_api/mobile_movei/presentation/controller/movies_state.dart';

import '../../domain/usecases/get_new_playing_movie_usecase.dart';
import '../../domain/usecases/get_popular_movie_usecase.dart';
import '../../domain/usecases/get_top_rated_movie_usecase.dart';

class MovieBloc extends Bloc<MoviesEvent, MovieState> {

  static MovieBloc get(context)=>BlocProvider.of(context);

  final GetNewPlayingMovie getNewPlayingMovie;
  final GetPopularMovie getPopularMovie;
  final GetTopRatedMovie getTopRatedMovie;

  MovieBloc(this.getNewPlayingMovie, this.getPopularMovie, this.getTopRatedMovie) : super(const MovieState()) {
    on<GetNowPlayingMoviesEvent>(getNowPlayingMovies);
    on<GetPopularMoviesEvent>(getPopularMovies);
    on<GetTopRatedMoviesEvent>(getTopRatedMovies);
  }

  FutureOr<void> getNowPlayingMovies(GetNowPlayingMoviesEvent event, Emitter<MovieState> emit) async {

    final result = await getNewPlayingMovie(const NoParameters());
    result.fold(
            (l) => emit(state.copyWith(
            nowPlayingMessage: l.message,
            nowPlayingState: RequestState.error)),
            (r) => emit(state.copyWith(
            nowPlayingMovies: r,
            nowPlayingState: RequestState.loaded
        )));
  }


  FutureOr<void> getPopularMovies(GetPopularMoviesEvent event, Emitter<MovieState> emit)  async {

    final result = await getPopularMovie(const NoParameters());
    result.fold(
            (l) => emit(state.copyWith(
            popularMessage: l.message,
            popularState: RequestState.error)),
            (r) => emit(state.copyWith(
            popularMovie: r,
            popularState: RequestState.loaded
        )));
  }




  FutureOr<void> getTopRatedMovies(GetTopRatedMoviesEvent event, Emitter<MovieState> emit)  async {

    final result = await getTopRatedMovie(const NoParameters());
    result.fold(
            (l) => emit(state.copyWith(
            topRatedMessage: l.message,
            topRatedState: RequestState.error)),
            (r) => emit(state.copyWith(
            topRatedMovie: r,
            topRatedState: RequestState.loaded
        )));
  }




}
