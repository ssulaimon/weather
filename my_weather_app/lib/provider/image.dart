import 'dart:math';

String generateRandomImage() {
  Random random = Random();
  int generateRandomImage = random.nextInt(3);
  List<String> imagesList = [
    'images/raining.gif',
    'images/snowing.gif',
    'images/sun.gif',
  ];
  return imagesList[generateRandomImage];
}
