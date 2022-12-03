import 'package:flutter/material.dart';
import 'package:my_weather_app/provider/router/my_router.dart';

void main() {
  runApp(
    MaterialApp.router(
      routerConfig: MyRouter.goRouter,
    ),
  );
}
