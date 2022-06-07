part of 'package:next_millionnaire/imports.dart';

class HomeViewController extends GetxController{
String greeting(context) {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      return "Good morning";
    }
    if (hour < 17) {
      return "Good afternoon";
    }
    return "Good evening";
  }
}