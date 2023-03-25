import 'package:get_it/get_it.dart';
import 'package:movei_api/mobile_movei/data/datasource/movie_remote_data_source.dart';
import 'package:movei_api/mobile_movei/data/repository/movies_repository.dart';
import 'package:movei_api/mobile_movei/domain/repository/base_movie_repository.dart';
import 'package:movei_api/mobile_movei/domain/usecases/get_new_playing_movie_usecase.dart';
import 'package:movei_api/mobile_movei/domain/usecases/get_popular_movie_usecase.dart';
import 'package:movei_api/mobile_movei/domain/usecases/get_recommendation_usecase.dart';
import 'package:movei_api/mobile_movei/domain/usecases/get_top_rated_movie_usecase.dart';
import 'package:movei_api/mobile_movei/presentation/controller/movie_details_bloc.dart';
import 'package:movei_api/mobile_movei/presentation/controller/movies_bloc.dart';

import '../../mobile_movei/domain/usecases/get_details_usecase.dart';

//singlton
final servicesLocator = GetIt.instance;

class ServicesLocator {
  void setup() {
    ///Bloc
    /////كل مره هيعمل اوبجيكت عكس ال singlton
    servicesLocator.registerFactory(
      () => MovieBloc(
        servicesLocator(),
        servicesLocator(),
        servicesLocator(),
      ),
    );
    servicesLocator.registerFactory(
      () => MovieDetailsBloc(servicesLocator(), servicesLocator()),
    );

    ///useCase
    servicesLocator
        .registerLazySingleton(() => GetNewPlayingMovie(servicesLocator()));
    servicesLocator
        .registerLazySingleton(() => GetPopularMovie(servicesLocator()));
    servicesLocator
        .registerLazySingleton(() => GetTopRatedMovie(servicesLocator()));
    servicesLocator
        .registerLazySingleton(() => GetMovieDetails(servicesLocator()));
    servicesLocator
        .registerLazySingleton(() => RecommendationUsecase(servicesLocator()));

    ///repository
    servicesLocator.registerLazySingleton<BaseMovieRepository>(
        () => MovieRepository(servicesLocator()));

    ///dataSource
    servicesLocator.registerLazySingleton<BaseMovieRemoteDataSource>(
        () => MovieRemoteDataSource());
  }
}
