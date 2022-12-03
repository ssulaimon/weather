import 'package:flutter/material.dart';

import 'package:gif/gif.dart';
import 'package:go_router/go_router.dart';
import 'package:my_weather_app/const/colors.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MyColors.cBackground,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const ErorGif(),
              const SizedBox(
                height: 30,
              ),
              Text(
                'Something Went Wrong!!!. Make Sure You Input Correct Location and Connected to Internet',
                style: TextStyle(
                  color: MyColors.cWhite,
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 30,
              ),
              const BackButton()
            ],
          ),
        ));
  }
}

class ErorGif extends StatefulWidget {
  const ErorGif({super.key});

  @override
  State<ErorGif> createState() => _ErorGifState();
}

class _ErorGifState extends State<ErorGif> with TickerProviderStateMixin {
  late GifController gifController;

  @override
  void initState() {
    gifController = GifController(vsync: this);
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
      autostart: Autostart.loop,
      image: const AssetImage(
        'images/error.gif',
      ),
    );
  }
}

class BackButton extends StatelessWidget {
  const BackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => GoRouter.of(context).pop(),
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
            color: MyColors.cYellow, borderRadius: BorderRadius.circular(10)),
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.arrow_back_ios,
              color: MyColors.cBlack,
            ),
            Text(
              'Back',
              style: TextStyle(color: MyColors.cBlack),
            )
          ],
        ),
      ),
    );
  }
}
