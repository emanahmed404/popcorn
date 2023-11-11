import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:popcorn/core/error/failure.dart';
import 'package:popcorn/core/use_case/base_use_case.dart';
import 'package:popcorn/movies/domain/entities/recommendations_entity.dart';
import 'package:popcorn/movies/domain/repositories/base_movie_repository.dart';

class GetRecommendationsUseCase
    extends BaseUseCase<List<Recommendations>, RecommendationsParameters> {
  final BaseMovieRepository baseMovieRepository;

  GetRecommendationsUseCase(this.baseMovieRepository);

  @override
  Future<Either<Failure, List<Recommendations>>> call(RecommendationsParameters parameters) async{
    return await baseMovieRepository.getRecommendations(parameters);
  }
}

class RecommendationsParameters extends Equatable {
  final int id;

  const RecommendationsParameters(this.id);

  @override
  List<Object> get props => [id];
}
