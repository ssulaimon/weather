import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_weather_app/const/const.dart';
import 'package:my_weather_app/model/model.dart';
import 'package:my_weather_app/provider/api_call/api_call.dart';

class ButtonFunctions {
  static void getWeather({
    required GlobalKey<FormState> validator,
    required String location,
    required BuildContext context,
  }) async {
    if (validator.currentState!.validate()) {
      var snackbar = const SnackBar(
          content: Text(
        'Getting Weather Report',
      ));
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
      Model? result = await Apicall(location: location).getWeather();
      if (result == null) {
        // ignore: use_build_context_synchronously
        GoRouter.of(context).pushNamed(GoRouterName.eror);
      } else {
        // ignore: use_build_context_synchronously
        GoRouter.of(context).pushNamed(
          GoRouterName.weatherReport,
          extra: result,
        );
      }
    }
  }

  static goBack({required BuildContext context}) {
    context.pop();
  }
}
