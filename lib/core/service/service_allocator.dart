import 'package:get_it/get_it.dart';
import 'package:popcorn/movies/data/data_repositories/movie_repository.dart';
import 'package:popcorn/movies/data/data_source/remote_data_sources/movie_remote_data_source.dart';
import 'package:popcorn/movies/domain/repositories/base_movie_repository.dart';
import 'package:popcorn/movies/domain/usecases/get_movie_details_usecase.dart';
import 'package:popcorn/movies/domain/usecases/get_now_playing_movies_usecase.dart';
import 'package:popcorn/movies/domain/usecases/get_popular_movies_usecase.dart';
import 'package:popcorn/movies/domain/usecases/get_recommendations_usecase.dart';
import 'package:popcorn/movies/domain/usecases/get_top_rated_movies_usecase.dart';
import 'package:popcorn/movies/presentaion/controllers/bloc_state_management/movies_bloc.dart';
import 'package:popcorn/movies/presentaion/controllers/movie_details_controller/movie_details_bloc.dart';

final sl = GetIt.instance;

class ServiceAllocator {
  void init() {
    ///bloc
    sl.registerFactory(() => MoviesBloc(sl(), sl(), sl()));
    sl.registerFactory(() => MovieDetailsBloc( sl(),sl()));


    ///use case
    sl.registerLazySingleton(() => GetNowPlayingMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetPopularMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetTopRatedMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetMovieDetailUseCase(sl()));
    sl.registerLazySingleton(() => GetRecommendationsUseCase(sl()));



    ///data Repository
    sl.registerLazySingleton<BaseMovieRepository>(() => MovieRepository(sl()));

    ///data source
    sl.registerLazySingleton<BaseMovieRemoteDataSource>(
        () => MovieRemoteDataSource());
  }
}
