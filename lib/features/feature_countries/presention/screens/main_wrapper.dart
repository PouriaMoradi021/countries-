import 'package:countries/features/feature_countries/presention/screens/countries_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../locator.dart';
import '../bloc/home_bloc.dart';

class MainWrapper extends StatelessWidget {
  const MainWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (_) => locator<HomeBloc>(),
        child: CountriesScreen(),
      ),
    );
  }
}
