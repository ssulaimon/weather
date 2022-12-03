import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:my_weather_app/model/model.dart';

class Apicall {
  String location;
  Apicall({
    required this.location,
  });
  Future<Model?> getWeather() async {
    Dio dio = Dio();

    try {
      Response response =
          await dio.get('https://weatherapi-com.p.rapidapi.com/forecast.json',
              options: Options(headers: {
                'X-RapidAPI-Key':
                    '7bc9f390d3msh22d9698290555c5p1d962ejsn7e39abbb49ad',
              }),
              queryParameters: {
            'q': location,
            'days': 1,
          });

      if (response.statusCode == 200) {
        Map json = await response.data;
        print(json['location']['name']);

        Model data = Model(
            location: json['location']['name'],
            conditionText: json['current']['condition']['text'],
            country: json['location']['country'],
            tempC: json['current']['temp_c'].toString(),
            tempF: json['current']['temp_f'].toString());

        return data;
      } else if (response.statusCode == 400) {
        log(response.statusCode.toString());
        return null;
      } else {
        return null;
      }
    } on DioError catch (error) {
      log(error.message);
      return null;
    }
  }
}
