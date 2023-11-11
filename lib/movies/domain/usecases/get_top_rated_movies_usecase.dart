import 'package:dartz/dartz.dart';
import 'package:popcorn/core/use_case/base_use_case.dart';
import 'package:popcorn/movies/domain/entities/movie_entity.dart';
import 'package:popcorn/movies/domain/repositories/base_movie_repository.dart';

import '../../../core/error/failure.dart';

class GetTopRatedMoviesUseCase extends BaseUseCase<List<Movie> ,NoParameters> {
  final BaseMovieRepository baseMovieRepository;

  GetTopRatedMoviesUseCase(this.baseMovieRepository);

  @override
  Future<Either<Failure, List<Movie>>> call(NoParameters parameters) async {
    return await baseMovieRepository.getTopRatedMovies();
  }
}
