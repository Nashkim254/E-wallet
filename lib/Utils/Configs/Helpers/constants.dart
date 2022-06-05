part of '../helpers.dart';

//Static Strings
const String appName = "Next Millionnaire";

//Animation values below
const Duration duration200 = Duration(milliseconds: 200);
const Duration duration400 = Duration(milliseconds: 400);
const Duration duration600 = Duration(milliseconds: 600);
const Duration duration800 = Duration(milliseconds: 800);
const Duration duration1000 = Duration(milliseconds: 1000);
const Duration duration1200 = Duration(milliseconds: 1200);

//Spacing values Below
const double space150 = 150.0;
const double space100 = 100.0;
const double space50 = 50.0;
const double space40 = 40.0;
const double space30 = 30.0;
const double space25 = 25.0;
const double space20 = 20.0;
const double space15 = 15.0;
const double space10 = 10.0;
const double space5 = 5.0;
const double space7 = 7.0;
const double space2 = 2.5;
const double space1 = 1.0;

String globalDeviceId = "";

// Full screen width and height
Future<double> getScreenWidthSize(context) async {
  return MediaQuery.of(context).size.width;
}

// Full screen height
Future<double> getScreenHeightSize(context) async {
  return MediaQuery.of(context).size.height;
}

var countryCode =  Get.deviceLocale!.countryCode == "SS" ? '211' : Get.deviceLocale!.countryCode == "KE" ? '254' : '254';
var code =  Get.deviceLocale!.countryCode == "SS" ? '9' : Get.deviceLocale!.countryCode == "KE" ? '7' : '9';
var codeTwo =  Get.deviceLocale!.countryCode == "SS" ? '7' : Get.deviceLocale!.countryCode == "KE" '1';

/// Valid phone number
String formatPhoneNumber(String number) {
  String phoneNumber = number.replaceAll(" ", "");

  if (phoneNumber.startsWith("+")) phoneNumber = phoneNumber.substring(1);

  if (phoneNumber.startsWith("0"))
    phoneNumber = phoneNumber.replaceFirst("0", "$countryCode");

  if (phoneNumber.startsWith("$code") || phoneNumber.startsWith("$codeTwo"))
    phoneNumber = "$countryCode$phoneNumber";

  return phoneNumber;
}
/// Valid phone number tf
String formatPhone(String number) {
  String phoneNumber = number.replaceAll(" ", "");

  if (phoneNumber.startsWith("+")) phoneNumber = phoneNumber.substring(1);

  return phoneNumber;
}

String? validatorEmpty(String value) {
  if (value.isEmpty) {
    return 'Required field';
  }
  return null;
}

//validate phone number
String? validatePhone(String value) {
  if (value.length < 9 || value.length > 15) {
    return 'Invalid phone number';
  }
  return null;
}

//pn
String? validatePersonalNo(String value) {
  if (value.length < 6 || value.length > 9) {
    return 'Invalid personal number';
  }
  return null;
}
String? validatePassportNo(String value) {
  if (value.length <  6|| value.length > 15) {
    return 'Invalid passport number';
  }
  return null;
}

initToken() {
  List<int> token = new List<int>.filled(20, 0, growable: false);
  // List<int> token = new List<int>(20);
  int b = 16;
  for (int a = 0; a < 20; a++) {
    int c = (b ~/ 2);
    token[a] = ((b | ((a + c) >> b)) << 4);
    b++;
  }
  String f = String.fromCharCodes(token);
  return f;
}



  