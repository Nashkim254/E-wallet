part of 'package:next_millionnaire/imports.dart';
class AdminController extends GetxController{
    TextEditingController amount = TextEditingController();
  TextEditingController name = TextEditingController();

  String? nameValidator(String value) {
    if (value.isEmpty) {
      return "Name cannot be empty";
    } else {
      return null;
    }
  }

  String? amountValidator(String value) {
    if (value.isEmpty) {
      return "Amount cannot be empty";
    } else if (value.length < 3) {
      return "Amount cannot be less than 6 characters";
    } else {
      return null;
    }
  }
}