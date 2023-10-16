import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterapp/models/place_model.dart';
import 'package:flutterapp/pages/search/search_bloc.dart';
import 'package:flutterapp/pages/search/search_state.dart';
import 'package:go_router/go_router.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchBloc(),
      child: BlocBuilder<SearchBloc, SearchState>(
        builder: (context, state) {
          return GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Scaffold(
              appBar: AppBar(
                title: const Text("Weather App"),
                backgroundColor: Theme.of(context).colorScheme.inversePrimary,
              ),
              body: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      decoration: const InputDecoration(
                        hintText: "Input your place",
                        border: OutlineInputBorder(),
                        helperText:
                            'Start entering city name, US zip code, Canada postal code, UK postcode, ip, metar, etc.',
                        helperMaxLines: 2,
                      ),
                      onChanged: (text) => context.read<SearchBloc>().getPlaces(search: text),
                      textInputAction: TextInputAction.go,
                      onSubmitted: (value) {
                        context.goNamed(
                          'weather',
                          queryParameters: {'query': value},
                        );
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(builder: (context) {
                        //     return ViewWeatherPage(query: value);
                        //   }),
                        // );
                      },
                    ),
                  ),
                  Expanded(
                    child: state.isLoading
                        ? const CupertinoActivityIndicator()
                        : SingleChildScrollView(
                            child: Column(
                              children: state.data.map(_searchResultItem).toList(),
                            ),
                          ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _searchResultItem(PlaceModel data) {
    return GestureDetector(
      onTap: () {
        final query = '${data.lat},${data.lon}';
        context.goNamed(
          'weather',
          queryParameters: {'query': query},
        );
        // Navigator.push(context, MaterialPageRoute(builder: (context) {
        //   return ViewWeatherPage(query: '${data.lat},${data.lon}');
        // }));
      },
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Expanded(child: Text(data.displayName ?? '')),
            const SizedBox(width: 8),
            const Icon(Icons.arrow_forward_ios_rounded, size: 16),
          ],
        ),
      ),
    );
  }
}
