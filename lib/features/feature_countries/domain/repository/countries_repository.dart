import 'package:countries/features/feature_countries/domain/entities/countries_entity.dart';

import '../../../../core/resources/data-state.dart';

abstract class CountriesRepository{
 Future <List<CountriesEntities>>fetchCountriesData() ;
}