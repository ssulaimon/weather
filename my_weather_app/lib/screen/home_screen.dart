import 'package:flutter/material.dart';
import 'package:gif/gif.dart';
import 'package:go_router/go_router.dart';
import 'package:my_weather_app/const/colors.dart';
import 'package:my_weather_app/const/const.dart';
import 'package:my_weather_app/provider/button_functions/button_functions.dart';
import 'package:my_weather_app/provider/text_form_field_validator.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> key = GlobalKey<FormState>();
    TextEditingController controller = TextEditingController();
    return Scaffold(
      backgroundColor: MyColors.cBackground,
      body: SingleChildScrollView(
        child: Form(
          key: key,
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Center(
                  child: AnimatedRain(),
                ),
                Text(
                  'Know The Weather Condition Before Stepping Out Today',
                  style: TextStyle(
                    color: MyColors.cWhite,
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: TextFormField(
                    controller: controller,
                    validator: (text) => TextFormFieldValidator().validateValue(
                      value: text!,
                    ),
                    style: TextStyle(
                      color: MyColors.cWhite,
                    ),
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.location_on,
                        color: MyColors.cWhite,
                      ),
                      hintText: 'Input Your City or Location',
                      hintStyle: TextStyle(
                        color: MyColors.cWhite,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: MyColors.cWhite,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: MyColors.cWhite,
                        ),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: MyColors.cRed,
                        ),
                      ),
                      errorStyle: TextStyle(
                        color: MyColors.cWhite,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                MyButton(
                  validator: key,
                  location: controller,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AnimatedRain extends StatefulWidget {
  const AnimatedRain({super.key});

  @override
  State<AnimatedRain> createState() => _AnimatedRainState();
}

class _AnimatedRainState extends State<AnimatedRain>
    with TickerProviderStateMixin {
  late GifController gifController;
  @override
  void initState() {
    gifController = GifController(
      vsync: this,
    );

    super.initState();
  }

  @override
  void dispose() {
    gifController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Gif(
      controller: gifController,
      image: AssetImage(image),
      autostart: Autostart.loop,
      height: 300,
      width: 300,
    );
  }
}

// ignore: must_be_immutable
class MyButton extends StatelessWidget {
  GlobalKey<FormState> validator;
  TextEditingController location;
  MyButton({
    super.key,
    required this.validator,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => ButtonFunctions.getWeather(
        validator: validator,
        location: location.text,
        context: context,
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 20,
        ),
        margin: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        decoration: BoxDecoration(
            color: MyColors.cYellow, borderRadius: BorderRadius.circular(10)),
        alignment: Alignment.center,
        child: Text(
          'Get Weather',
          style: TextStyle(
            color: MyColors.cBlack,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
