part of '../helpers.dart';

//fingerprint

//check biometric

class FingerprintController extends GetxController {
  final LocalAuthentication auth = LocalAuthentication();
  Future<void> checkBiometrics() async {
    late bool canCheckBiometrics;
    try {
      canCheckBiometrics = await auth.canCheckBiometrics;
      print(canCheckBiometrics);
      if (canCheckBiometrics) {
        authenticateUser();
      }
    } on PlatformException catch (e) {
      canCheckBiometrics = false;
      print("========" + e.toString());
    }
    update();
  }

  // Authenticate
  Future<void> authenticateUser() async {
    bool isAuth = false;
    try {
      isAuth = await auth.authenticate(
          localizedReason: "Scan your fingerprint to authenticate",
          options: const AuthenticationOptions(
            biometricOnly: true,
            stickyAuth: true,
            useErrorDialogs: true,
          ));
      if (isAuth) {
        // Get.to(Receipt());
      }
    } on PlatformException catch (e) {
      print(e);
    }
    update();
  }
}
