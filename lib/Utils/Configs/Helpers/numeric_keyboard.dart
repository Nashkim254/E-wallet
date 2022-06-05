import 'dart:io';

import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';

typedef KeyboardTapCallback = void Function(String text);

class NumericKeyboard extends StatefulWidget {
  /// Color of the text [default = Colors.black]
  final Color textColor;

  /// Display a custom right icon
  final Icon? rightIcon;

  /// Action to trigger when right button is pressed
  final Function()? rightButtonFn;

  /// Display a custom left icon
  final Icon? leftIcon;

  /// Action to trigger when left button is pressed
  final Function()? leftButtonFn;

  /// Callback when an item is pressed
  final KeyboardTapCallback onKeyboardTap;

  /// Main axis alignment [default = MainAxisAlignment.spaceEvenly]
  final MainAxisAlignment mainAxisAlignment;

  NumericKeyboard(
      {Key? key,
      required this.onKeyboardTap,
      this.textColor = Colors.black,
      this.rightButtonFn,
      this.rightIcon,
      this.leftButtonFn,
      this.leftIcon,
      this.mainAxisAlignment = MainAxisAlignment.spaceEvenly})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _NumericKeyboardState();
  }
}

class _NumericKeyboardState extends State<NumericKeyboard> {
  final LocalAuthentication auth = LocalAuthentication();
  late List<BiometricType> availableBiometrics;
  bool isAuth = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      padding: const EdgeInsets.only(top: 20),
      alignment: Alignment.center,
      child: Column(
        children: <Widget>[
          ButtonBar(
            alignment: widget.mainAxisAlignment,
            children: <Widget>[
              _calcButton('1'),
              _calcButton('2'),
              _calcButton('3'),
            ],
          ),
          SizedBox(
            height: 23,
          ),
          ButtonBar(
            alignment: widget.mainAxisAlignment,
            children: <Widget>[
              _calcButton('4'),
              _calcButton('5'),
              _calcButton('6'),
            ],
          ),
          SizedBox(
            height: 23,
          ),
          ButtonBar(
            alignment: widget.mainAxisAlignment,
            children: <Widget>[
              _calcButton('7'),
              _calcButton('8'),
              _calcButton('9'),
            ],
          ),
          SizedBox(
            height: 23,
          ),
          ButtonBar(
            alignment: widget.mainAxisAlignment,
            children: <Widget>[
             InkWell(
                  borderRadius: BorderRadius.circular(45),
                  onTap: widget.leftButtonFn,
                  child: Container(
                      alignment: Alignment.center,
                      width: 50,
                      height: 50,
                      child: widget.leftIcon)),
              _calcButton('0'),
              InkWell(
                      borderRadius: BorderRadius.circular(45),
                      onTap: widget.rightButtonFn,
                      child: Container(
                          alignment: Alignment.center,
                          width: 50,
                          height: 50,
                          child: widget.rightIcon))
            ],
          ),
        ],
      ),
    );
  }

  checkPlartformFingeprint() async {
    try {
      availableBiometrics = await auth.getAvailableBiometrics();
    } catch (e) {
      print("error enumerate biometrics $e");
    }
    if (Platform.isIOS) {
      if (availableBiometrics.contains(BiometricType.fingerprint)) {
        // Touch ID.
        isAuth = true;
      } else {
        isAuth = false;
      }
    } else if (Platform.isAndroid) {
      if (availableBiometrics.contains(BiometricType.fingerprint)) {
        // Fingerprint.
        isAuth = true;
      } else {
        isAuth = false;
      }
    } else {
      isAuth = false;
    }
  }

  Widget _calcButton(String value) {
    return InkWell(
        borderRadius: BorderRadius.circular(45),
        onTap: () {
          widget.onKeyboardTap(value);
        },
        child: Container(
          alignment: Alignment.center,
          width: 50,
          height: 50,
          child: Text(
            value,
            style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: widget.textColor),
          ),
        ));
  }
}
