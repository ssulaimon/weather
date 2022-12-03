import 'package:flutter/material.dart';
import 'package:my_weather_app/const/colors.dart';
import 'package:my_weather_app/model/model.dart';
import 'package:my_weather_app/provider/button_functions/button_functions.dart';

class WeatherReportScreen extends StatelessWidget {
  Model model;
  WeatherReportScreen({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.cBackground,
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Weather Forcast',
            style: TextStyle(
                color: MyColors.cWhite,
                fontSize: 20,
                fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 30,
          ),
          CustomCard(
            location: model.location,
            country: model.country,
            degree: model.tempC,
            comment: model.conditionText,
          ),
          const SizedBox(
            height: 30,
          ),
          const BackButton()
        ],
      )),
    );
  }
}

class CustomCard extends StatelessWidget {
  String location;
  String country;
  String degree;
  String comment;
  CustomCard({
    super.key,
    required this.comment,
    required this.degree,
    required this.location,
    required this.country,
  });

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Center(
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: MyColors.cardColor,
          borderRadius: BorderRadius.circular(
            20,
          ),
        ),
        height: height * 0.4,
        width: width * 0.9,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Today',
              style: TextStyle(
                color: MyColors.cWhite,
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
            Center(
              child: Text(
                location.toUpperCase(),
                style: TextStyle(
                  color: MyColors.cWhite,
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Center(
              child: Text(
                country,
                style: TextStyle(
                  color: MyColors.cWhite,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: RichText(
                text: TextSpan(children: [
                  TextSpan(
                      text: degree,
                      style: TextStyle(
                        color: MyColors.cWhite,
                        fontSize: 70,
                        fontWeight: FontWeight.w700,
                      )),
                  TextSpan(
                      text: '°C',
                      style: TextStyle(
                        color: MyColors.cYellow,
                        fontSize: 70,
                        fontWeight: FontWeight.w700,
                      )),
                ]),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Center(
              child: Text(
                comment,
                style: TextStyle(
                  color: MyColors.cWhite,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class BackButton extends StatelessWidget {
  const BackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => ButtonFunctions.goBack(
        context: context,
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: MyColors.cYellow,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.arrow_back_ios,
              color: MyColors.cBlack,
            ),
            Text(
              'Back',
              style: TextStyle(
                color: MyColors.cBlack,
                fontWeight: FontWeight.w500,
              ),
            )
          ],
        ),
      ),
    );
  }
}
