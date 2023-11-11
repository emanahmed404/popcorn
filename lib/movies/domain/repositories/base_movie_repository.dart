import 'package:dartz/dartz.dart';
import 'package:popcorn/movies/domain/entities/recommendations_entity.dart';
import 'package:popcorn/movies/domain/usecases/get_movie_details_usecase.dart';
import 'package:popcorn/movies/domain/usecases/get_recommendations_usecase.dart';

import '../../../core/error/failure.dart';
import '../entities/movie_details_entity.dart';
import '../entities/movie_entity.dart';

abstract class BaseMovieRepository {
  Future<Either< Failure, List<Movie>>> getPlayingNowMovies();

  Future<Either< Failure, List<Movie>>> getPopularMovies();

  Future<Either< Failure, List<Movie>>> getTopRatedMovies();

  Future<Either< Failure, MovieDetails>> getMovieDetails(MovieDetailsParameters parameters);
  Future<Either< Failure, List<Recommendations>>> getRecommendations(RecommendationsParameters parameters);


}
