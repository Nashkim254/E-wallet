part of 'package:next_millionnaire/imports.dart';

class SigninController extends GetxController {
  final _formKeyLogIn = GlobalKey<FormState>();
  TextEditingController emailCont = TextEditingController();
  TextEditingController passCont = TextEditingController();

  String? emailValidator(String value) {
    if (value.isEmpty) {
      return "Email cannot be empty";
    } else {
      return null;
    }
  }

  String? passValidator(String value) {
    if (value.isEmpty) {
      return "Password cannot be empty";
    } else if (value.length < 6) {
      return "Password cannot be less than 6 characters";
    } else {
      return null;
    }
  }
}
