import 'package:dio/dio.dart';
import 'package:popcorn/core/error/exceptions.dart';
import 'package:popcorn/core/network/api_constants.dart';
import 'package:popcorn/core/network/error_message_model.dart';
import 'package:popcorn/movies/data/models/movie_details_model.dart';
import 'package:popcorn/movies/data/models/movie_model.dart';
import 'package:popcorn/movies/data/models/recommendations_model.dart';
import 'package:popcorn/movies/domain/entities/movie_details_entity.dart';
import 'package:popcorn/movies/domain/usecases/get_movie_details_usecase.dart';
import 'package:popcorn/movies/domain/usecases/get_recommendations_usecase.dart';

abstract class BaseMovieRemoteDataSource{
   Future<List<MovieModel>> getNowPlayingMovies();
   Future<List<MovieModel>> getPopularMovies();
   Future<List<MovieModel>> getTopRatedMovies();
   Future<MovieDetailsModel> getMovieDetails(MovieDetailsParameters parameters);
   Future<List<RecommendationsModel>> getRecommendations(RecommendationsParameters parameters);




}

class MovieRemoteDataSource extends BaseMovieRemoteDataSource {
 @override
  Future<List<MovieModel>> getNowPlayingMovies() async {
    final response = await Dio().get(ApiConstants.nowPlayingMoviesPath);
    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data['results'] as List)
          .map((result) => MovieModel.fromJson(result)));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }
 ////////////////////////////////////////////////////////////
 // Future<List<MovieModel>> getNowPlayingMovies() async {
 //   try {
 //     final response = await Dio().get(ApiConstants.nowPlayingMoviesPath);
 //     print('Response Status Code: ${response.statusCode}');
 //     if (response.statusCode == 200) {
 //       return List<MovieModel>.from((response.data['results'] as List)
 //           .map((result) => MovieModel.fromJson(result)));
 //     } else {
 //       // Handle non-200 status codes gracefully
 //       throw ServerException(
 //           errorMessageModel: ErrorMessageModel.fromJson(response.data));
 //     }
 //   } catch (error, stackTrace) {
 //     // Handle network errors, including "Failed host lookup"
 //     print('Error: $error');
 //     print('Stack Trace: $stackTrace');
 //     throw ErrorMessageModel(statusMessage: 'Network request failed',success: false,statusCode: 500);
 //   }
 // }


  @override
  Future<List<MovieModel>> getPopularMovies() async{
    final response = await Dio().get(ApiConstants.popularMoviesPath);
    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data['results'] as List)
          .map((result) => MovieModel.fromJson(result)));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
 }

  @override
  Future<List<MovieModel>> getTopRatedMovies() async{
    final response = await Dio().get(ApiConstants.topRatedPath);
    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data['results'] as List)
          .map((result) => MovieModel.fromJson(result)));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<MovieDetailsModel> getMovieDetails(MovieDetailsParameters parameters) async{
    final response = await Dio().get(ApiConstants.movieDetailsPath(parameters.movieId));
    if (response.statusCode == 200) {
      return MovieDetailsModel.fromJson(response.data);
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<RecommendationsModel>> getRecommendations(RecommendationsParameters parameters)async {
    final response = await Dio().get(ApiConstants.recommendationsPath(parameters.id));
    if (response.statusCode == 200) {
      return List<RecommendationsModel>.from((response.data['results'] as List)
          .map((result) => RecommendationsModel.fromJson(result)));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }
}
