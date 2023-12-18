part of 'home_bloc.dart';

abstract class HomeState {}

class CountriesInitial extends HomeState{}
class CountriesLoading extends HomeState{}
class CountriesLoaded extends HomeState{
  final List<CountriesEntities> countries;

  CountriesLoaded(this.countries);
}

class CountriesError extends HomeState{
  final String message;

  CountriesError(this.message);
}

