import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:popcorn/core/error/failure.dart';
import 'package:popcorn/core/use_case/base_use_case.dart';
import 'package:popcorn/movies/domain/entities/movie_details_entity.dart';
import 'package:popcorn/movies/domain/repositories/base_movie_repository.dart';

class GetMovieDetailUseCase extends BaseUseCase<MovieDetails, MovieDetailsParameters> {
  final BaseMovieRepository baseMovieDetailRepository;

  GetMovieDetailUseCase(this.baseMovieDetailRepository);

  @override
  Future<Either<Failure, MovieDetails>> call(MovieDetailsParameters parameters) async {
    return await baseMovieDetailRepository.getMovieDetails(parameters);
  }

}

class MovieDetailsParameters extends Equatable {
  final int movieId;
  const MovieDetailsParameters(this.movieId);

  @override
  List<Object> get props => [movieId];
}