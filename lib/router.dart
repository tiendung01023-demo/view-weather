// GoRouter configuration
import 'package:flutterapp/pages/search/search_page.dart';
import 'package:flutterapp/pages/view_weather/view_weather_page.dart';
import 'package:go_router/go_router.dart';

class MyRouter {
  static final config = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        name: 'search',
        path: '/',
        builder: (context, state) {
          return const SearchPage();
        },
      ),
      GoRoute(
        name: 'weather',
        path: '/weather',
        builder: (context, state) {
          final query = state.uri.queryParameters['query'] ?? '';
          return ViewWeatherPage(
            query: query,
          );
        },
      ),
    ],
  );
}
