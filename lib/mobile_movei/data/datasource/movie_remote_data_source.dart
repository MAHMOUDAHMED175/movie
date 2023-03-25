import 'package:dio/dio.dart';
import 'package:movei_api/core/network/error_message_model.dart';
import 'package:movei_api/core/utils/constants.dart';
import 'package:movei_api/mobile_movei/data/models/Movie_details_model.dart';
import 'package:movei_api/mobile_movei/data/models/movie_model.dart';
import 'package:movei_api/mobile_movei/domain/usecases/get_details_usecase.dart';

import '../../../core/error/exeptions.dart';
import '../../domain/usecases/get_recommendation_usecase.dart';
import '../models/recommendation_model.dart';

abstract class BaseMovieRemoteDataSource {
  Future<List<MovieModel>> getNowPlayingMovies();

  Future<List<MovieModel>> getPopularMovie();

  Future<List<MovieModel>> getTopRatedMovie();

  Future<MovieDetailsModel> getMovieDetails(GetDetailsParameters parameters);

  Future<List<RecommendationModel>> getRecommendation(
      ParametersRecommendation parameters);
}

class MovieRemoteDataSource extends BaseMovieRemoteDataSource {
  @override
  Future<List<MovieModel>> getNowPlayingMovies() async {
    final response = await Dio().get(AppConstance.nowPlayingPath);
    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data["results"] as List)
          .map((e) => MovieModel.fromJson(e)));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.formJson(response.data));
    }
  }
  @override
  Future<List<MovieModel>> getPopularMovie() async {
    final response = await Dio().get(AppConstance.popularPath);
    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data["results"] as List)
          .map((e) => MovieModel.fromJson(e)));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.formJson(response.data));
    }
  }
  @override
  Future<List<MovieModel>> getTopRatedMovie() async {
    final response = await Dio().get(AppConstance.topRatedPath);
    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data["results"] as List)
          .map((e) => MovieModel.fromJson(e)));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.formJson(response.data));
    }
  }
  @override
  Future<MovieDetailsModel> getMovieDetails(
      GetDetailsParameters parameters) async {
    final response =
        await Dio().get(AppConstance.getMovieDetails(parameters.intMovie));
    if (response.statusCode == 200) {
      return MovieDetailsModel.fromJson(response.data);
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.formJson(response.data));
    }
  }
  @override
  Future<List<RecommendationModel>> getRecommendation(
      ParametersRecommendation parameters) async {
    final response = await Dio().get(AppConstance.getRecommend(parameters.id));
    if (response.statusCode == 200) {
      return List<RecommendationModel>.from((response.data["results"] as List)
          .map((e) => RecommendationModel.fromJson(e)));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.formJson(response.data));
    }
  }
}
