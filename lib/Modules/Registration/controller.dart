part of 'package:next_millionnaire/imports.dart';

class RegController extends GetxController {
  final _formKeyReg = GlobalKey<FormState>();
  TextEditingController emailCont = TextEditingController();
  TextEditingController passCont = TextEditingController();
    TextEditingController nameCont = TextEditingController();
  TextEditingController confirmCont = TextEditingController();
  String p =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  String? emailValidator(String value) {
    RegExp regExp = RegExp(p);
    if (value.isEmpty) {
      return "Email Cannot be empty";
    }
    if (!regExp.hasMatch(value)) {
      return "Email format is incorrect";
    } else {
      return null;
    }
  }

  String? validator(String value) {
    if (value.isEmpty) {
      return "Field cannot be empty";
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
