import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterapp/models/weather_model.dart';
import 'package:flutterapp/pages/view_weather/view_weather_bloc.dart';
import 'package:flutterapp/pages/view_weather/view_weather_state.dart';
import 'package:go_router/go_router.dart';

class ViewWeatherPage extends StatefulWidget {
  const ViewWeatherPage({super.key, required this.query});

  final String query;

  @override
  State<ViewWeatherPage> createState() => _ViewWeatherPageState();
}

class _ViewWeatherPageState extends State<ViewWeatherPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ViewWeatherBloc(widget.query),
      child: BlocBuilder<ViewWeatherBloc, ViewWeatherState>(
        builder: (context, state) {
          return GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Scaffold(
              appBar: AppBar(
                title: const Text("Weather App"),
                backgroundColor: Theme.of(context).colorScheme.inversePrimary,
                leading: IconButton(
                  onPressed: () => context.goNamed('search'),
                  icon: const Icon(Icons.arrow_back_ios_new),
                ),
              ),
              body: Column(
                children: [
                  Expanded(
                    child: state.isLoading
                        ? const CupertinoActivityIndicator()
                        : state.isError
                            ? _buildError()
                            : _buildWeather(state.data),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildError() {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Center(
        child: Text(
          "We couldn't find weather information for the location you entered.\nPlease try again at another location",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
    );
  }

  Widget _buildWeather(WeatherModel? data) {
    final locationName = data?.location?.name;
    final tempC = data?.current?.tempC;
    final tempF = data?.current?.tempF;
    final conditionText = data?.current?.condition?.text;
    String? conditionIcon = data?.current?.condition?.icon;
    if (conditionIcon != null) {
      conditionIcon = 'https:$conditionIcon';
    }
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              locationName ?? '',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.normal,
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${tempC ?? '-'}°C',
                        style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '${tempF ?? '-'}°F',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (conditionIcon != null)
                        SizedBox(
                          height: 50,
                          child: Image.network(
                            conditionIcon,
                            errorBuilder: (_, __, ___) => Container(),
                          ),
                        ),
                      Text(
                        conditionText ?? '',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
