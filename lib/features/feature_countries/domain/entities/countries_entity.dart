import 'package:equatable/equatable.dart';

class CountriesEntities extends Equatable {
  final String name;
  final String capital;
  final String flag;

  CountriesEntities({required this.name, required this.capital, required this.flag});

  @override
  // TODO: implement props
  List<Object?> get props => [];


}

// class CountriesEntity extends Equatable {
//   final String? alpha2Code;
//   final String? alpha3Code;
//   final List<String>? altSpellings;
//   final num? area;
//   final List<String>? borders;
//   final List<String>? callingCodes;
//   final String? capital;
//   final List<Currencies>? currencies;
//   final String? demonym;
//   final String? flag;
//   final num? gini;
//   final  List<Languages>? languages;
//   final List<num>? latlng;
//   final  String? name;
//   final  String? nativeName;
//   final  String? numericCode;
//   final num? population;
//   final  String? region;
//   final  List<RegionalBlocs>? regionalBlocs;
//   final String? subregion;
//   final List<String>? timezones;
//   final  List<String>? topLevelDomain;
//   final  Translations? translations;
//   final  String? cioc;
//
//
//   const CountriesEntity({
//      this.alpha2Code,
//       this.alpha3Code,
//       this.altSpellings,
//       this.area,
//       this.borders,
//       this.callingCodes,
//       this.capital,
//       this.currencies,
//       this.demonym,
//       this.flag,
//       this.gini,
//       this.languages,
//       this.latlng,
//       this.name,
//       this.nativeName,
//       this.numericCode,
//       this.population,
//       this.region,
//       this.regionalBlocs,
//       this.subregion,
//       this.timezones,
//       this.topLevelDomain,
//       this.translations,
//       this.cioc
//   });
//
//   @override
//   // TODO: implement props
//   List<Object?> get props => [];
//
// }
