import 'package:go_router/go_router.dart';
import 'package:my_weather_app/const/const.dart';
import 'package:my_weather_app/model/model.dart';
import 'package:my_weather_app/screen/error_screen.dart';
import 'package:my_weather_app/screen/home_screen.dart';
import 'package:my_weather_app/screen/weather_report_screen.dart';

class MyRouter {
  static GoRouter goRouter = GoRouter(
    routes: [
      GoRoute(
        path: GoRouterPaths.home,
        name: GoRouterName.home,
        builder: (
          context,
          state,
        ) =>
            const HomeScreen(),
      ),
      GoRoute(
        path: GoRouterPaths.error,
        name: GoRouterName.eror,
        builder: (
          context,
          state,
        ) =>
            const ErrorScreen(),
      ),
      GoRoute(
          path: GoRouterPaths.weatherReport,
          name: GoRouterName.weatherReport,
          builder: (context, state) {
            return WeatherReportScreen(
              model: state.extra as Model,
            );
          })
    ],
  );
}
