import 'package:countries/core/use_case/use_case.dart';
import 'package:countries/features/feature_countries/domain/repository/countries_repository.dart';

import '../entities/countries_entity.dart';

//Because we have a method called call in all our use cases
class GetCountriesUseCase extends UseCase<List<CountriesEntities>> {
  final CountriesRepository countriesRepository;

  GetCountriesUseCase(this.countriesRepository);

  @override
  Future<List<CountriesEntities>> call() async {
    return await countriesRepository.fetchCountriesData();
  }
}
