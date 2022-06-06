part of 'package:next_millionnaire/imports.dart';

class SplashScreenController extends GetxController {
  bool isLoading = false;
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  TimeOfDay midnight = TimeOfDay(hour: 00, minute: 00);
  var now = TimeOfDay.now();
  var scansDone = 0.obs;
  var scans = 3;
  var _isLoading = true.obs;
  var token = "".obs;
  Future resetScans() async {
    final SharedPreferences prefs = await _prefs;
    if (now == midnight) {
      prefs.setInt("scansDone", 0);
    }
  }

  var today = DateTime.now();
  final splashDelay = 3;
  bool visitor = false;
  bool loggedIn = false;
  var userId = "".obs;
  void setLoader() {
    isLoading = true;
    update();
  }

  void onInit() {

    super.onInit();
  }




  String splashLogo(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light
        ? "assets/svg/Logo.svg"
        : "assets/svg/Logo.svg";
  }

  Future _loadWidget() async {
    var _duration = Duration(seconds: splashDelay);
    return Timer(_duration, goToApp);
  }

  Future<void> goToApp() async {
    final SharedPreferences prefs = await _prefs;
    if (prefs.getBool("visitor") ?? false) {
      visitor = prefs.getBool("visitor") ?? true;
      prefs.setBool("visitor", true);
    } else {
      loggedIn = prefs.getBool("loggedIn") ?? true;
      ;
      prefs.setBool("loggedIn", true);
      visitor = true;
    }

    if (visitor) {
      Get.off(() => OnBoardingView(),
          curve: Curves.fastOutSlowIn,
          transition: Transition.fadeIn,
          duration: const Duration(milliseconds: 1500));
    }  
    else {
        Get.off(() => OnBoardingView(),
            curve: Curves.fastOutSlowIn,
            transition: Transition.fadeIn,
            duration: const Duration(milliseconds: 1500));
      }
    }
  
}
