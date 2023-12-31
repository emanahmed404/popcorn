import 'package:dartz/dartz.dart';
import 'package:popcorn/core/error/exceptions.dart';
import 'package:popcorn/core/error/failure.dart';
import 'package:popcorn/movies/data/data_source/remote_data_sources/movie_remote_data_source.dart';
import 'package:popcorn/movies/domain/entities/movie_details_entity.dart';
import 'package:popcorn/movies/domain/entities/movie_entity.dart';
import 'package:popcorn/movies/domain/entities/recommendations_entity.dart';
import 'package:popcorn/movies/domain/repositories/base_movie_repository.dart';
import 'package:popcorn/movies/domain/usecases/get_movie_details_usecase.dart';
import 'package:popcorn/movies/domain/usecases/get_recommendations_usecase.dart';

class MovieRepository extends BaseMovieRepository{
  final BaseMovieRemoteDataSource baseMovieRemoteDataSource ;

  MovieRepository(this.baseMovieRemoteDataSource);

  @override
  Future<Either< Failure, List<Movie>>> getPlayingNowMovies() async{
    final result =await baseMovieRemoteDataSource.getNowPlayingMovies();
    try{
      return Right(result);
    }on ServerException  catch(failure){
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }


  }

  @override
  Future<Either< Failure, List<Movie>>> getPopularMovies() async {
    final result =await baseMovieRemoteDataSource.getPopularMovies();
    try{
      return Right(result);
    }on ServerException  catch(failure){
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either< Failure, List<Movie>>> getTopRatedMovies() async {
    final result =await baseMovieRemoteDataSource.getTopRatedMovies();
    try{
      return Right(result);
    }on ServerException  catch(failure){
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, MovieDetails>> getMovieDetails(MovieDetailsParameters parameters) async {
    final result =await baseMovieRemoteDataSource.getMovieDetails(parameters);
    try{
      return Right(result);
    }on ServerException  catch(failure){
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Recommendations>>> getRecommendations(RecommendationsParameters parameters) async{
    final result =await baseMovieRemoteDataSource.getRecommendations(parameters);
    try{
      return Right(result);
    }on ServerException  catch(failure){
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }




}