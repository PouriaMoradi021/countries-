import 'package:countries/features/feature_countries/presention/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:dotted_line/dotted_line.dart';

class CountriesScreen extends StatefulWidget {
  const CountriesScreen({super.key});

  @override
  State<CountriesScreen> createState() => _CountriesScreenState();
}

class _CountriesScreenState extends State<CountriesScreen> {
  @override
  void initState() {
    BlocProvider.of<HomeBloc>(context).add(LoadCountryEvent());
    super.initState();
  }

  double width = 0;
  double height = 0;
  double padding = 0;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    padding = width * 0.06 + height * 0.09;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Countries info'),
        backgroundColor: Color(0xff2D9596),
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          {
            if (state is CountriesLoaded /*CountriesLoaded*/) {
              return ListView.builder(
                  itemCount: state.countries.length,
                  itemBuilder: (context, index) {
                    return Container(
                      width: width * 0.9,
                      height: height * 0.12,
                      color: Color(0xff9AD0C2),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            width: width * 0.98,
                            height: height * 0.01,
                            color: Color(0xffECF4D6),
                          ),
                          Container(
                            width: width * 0.98,
                            height: height * 0.09,
                            color: Color(0xffECF4D6),
                            child: Row(
                              children: [
                                Container(
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.grey,
                                  ),
                                  width: height * 0.09,
                                  height: height * 0.09,
                                  child: ClipOval(
                                    child: SvgPicture.network(
                                      state.countries[index].flag,
                                      fit: BoxFit.fitHeight,
                                    ),
                                  ),
                                ),
                                Container(
                                  width: width * 0.06,
                                  color: Color(0xffECF4D6),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: width * 0.7,
                                      child: Text(
                                        state.countries[index].name,
                                        style: const TextStyle(
                                            color: Color(0xFF484848),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 21),
                                        maxLines: 1,
                                        softWrap: false,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    Container(
                                      height: height * 0.008,
                                      color: Color(0xffECF4D6),
                                    ),
                                    Text(
                                      state.countries[index].capital,
                                      style: const TextStyle(
                                        color: Color(0xFFB0B0B0),
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: width * 0.98,
                            height: height * 0.01,
                            color: Color(0xffECF4D6),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: padding),
                            height: height * 0.01,
                            color: Color(0xffECF4D6),
                            alignment: Alignment.centerRight,
                            child: const DottedLine(
                              dashRadius: 2.2,
                              dashColor: Color(0xFFB0B0B0),
                              dashLength: 2.2,
                              dashGapLength: 4,
                              lineThickness: 2.2,
                            ),
                          ),
                        ],
                      ),
                    );
                  });
            } else if (state is CountriesLoading || state is CountriesInitial) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is CountriesError) {
              return Center(
                child: ElevatedButton(
                  onPressed: () {
                    BlocProvider.of<HomeBloc>(context).add(LoadCountryEvent());
                  },
                  child: const Text("Retry"),
                ),
              );
            } else {
              return const SizedBox();
            }
          }
        },
      ),
    );
  }
}
