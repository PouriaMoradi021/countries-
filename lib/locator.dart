import 'package:countries/features/feature-login/data/data_source/local/local_provider.dart';
import 'package:countries/features/feature-login/data/repository/users_repositoryimpl.dart';
import 'package:countries/features/feature-login/domain/repository/users_repository.dart';
import 'package:countries/features/feature-login/domain/use_cases/users_usecases.dart';
import 'package:countries/features/feature-login/presention/bloc/users_bloc.dart';
import 'package:countries/features/feature_countries/data/data_source/remote/api_provider.dart';
import 'package:countries/features/feature_countries/data/repository/countries-repositoryimpl.dart';
import 'package:countries/features/feature_countries/domain/repository/countries_repository.dart';
import 'package:countries/features/feature_countries/domain/use_cases/get_countries_usecase.dart';
import 'package:countries/features/feature_countries/presention/bloc/home_bloc.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

setUp() {
  //api
  locator.registerSingleton<ApiProvider>(ApiProvider());
  //repositories
  locator.registerSingleton<CountriesRepository>(
      CountriesRepositoryImpl(locator()));
  //use cases
  locator
      .registerSingleton<GetCountriesUseCase>(GetCountriesUseCase(locator()));
  //bloc
  locator.registerSingleton<HomeBloc>(HomeBloc(locator()));

  //read json file
  locator.registerSingleton<LocalProvider>(LocalProvider());
  //repository
  locator.registerSingleton<UsersRepository>(UsersRepositoryImpl(locator()));
  //use cases
  locator.registerSingleton<UsersUseCases>(UsersUseCases(locator()));
  //bloc
  locator.registerSingleton<UsersBloc>(UsersBloc(locator()));
}
