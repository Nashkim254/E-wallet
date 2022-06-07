part of 'package:next_millionnaire/imports.dart';

class SigninView extends StatelessWidget {
  SigninView({Key? key}) : super(key: key);
  final controller = Get.put(SigninController());
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 91.0, left: 41),
              child: Text(
                "Log In",
                style: theme.textTheme.bodyText1!.copyWith(
                    fontSize: 24,
                    color: blackColor,
                    fontWeight: FontWeight.w600),
              ),
            ),
            Form(
                key: controller._formKeyLogIn,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                        padding: const EdgeInsets.fromLTRB(41, 41, 41, 5),
                        child: TextFormField(
                            keyboardType: TextInputType.phone,
                            validator: (value) {},
                            onChanged: (value) {},
                            style: TextStyle(
                              color: accentColor,
                              fontSize: 15,
                            ),
                            decoration: InputDecoration(
                              hintText: "Email address",
                              border: const OutlineInputBorder(
                                borderSide: BorderSide(),
                              ),
                              hintStyle: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.black45,
                                  fontWeight: FontWeight.w500),
                              fillColor: Colors.white,
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                                borderSide: BorderSide(
                                  color: primaryColor,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                                borderSide: BorderSide(
                                  color: formFieldColor,
                                  width: 2.0,
                                ),
                              ),
                            ))),
                    Padding(
                        padding: const EdgeInsets.fromLTRB(41, 12, 41, 5),
                        child: TextFormField(
                            keyboardType: TextInputType.phone,
                            validator: (value) {},
                            onChanged: (value) {},
                            style: TextStyle(
                              color: accentColor,
                              fontSize: 15,
                            ),
                            decoration: InputDecoration(
                              hintText: "Password",
                              border: const OutlineInputBorder(
                                borderSide: BorderSide(),
                              ),
                              hintStyle: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.black45,
                                  fontWeight: FontWeight.w500),
                              fillColor: Colors.white,
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                                borderSide: BorderSide(
                                  color: primaryColor,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                                borderSide: BorderSide(
                                  color: formFieldColor,
                                  width: 2.0,
                                ),
                              ),
                            ))),
                  ],
                )),
            Padding(
                padding: const EdgeInsets.fromLTRB(0, 41, 0, 5),
                child: CustomButton(
                  buttoncolor: primaryColor,
                  height: 56,
                  label: Text(
                    "Log In",
                    style: TextStyle(
                        fontSize: 14,
                        color: cardLightColor,
                        fontWeight: FontWeight.w500),
                  ),
                  onPress: () {
                    Get.to(NavigationView());
                  },
                )),
            Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 41.0, top: 7),
                  child: InkWell(
                    onTap: () => Get.to(ForgotPasswordView()),
                    child: Text(
                      "Forgot Password?",
                      style: TextStyle(
                          fontSize: 14,
                          color: primaryColor,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                )),
            Padding(
                padding: const EdgeInsets.fromLTRB(41, 74, 0, 5),
                child: Text(
                  "Don't have an account?",
                  style: TextStyle(
                      fontSize: 14,
                      color: cardDarkColor,
                      fontWeight: FontWeight.w500),
                )),
            Padding(
                padding: const EdgeInsets.fromLTRB(41, 11, 0, 5),
                child: InkWell(
                  onTap: (() => Get.to(RegisterView())),
                  child: Text(
                    "R E G I S T E R   ->",
                    style: TextStyle(
                        fontSize: 14,
                        color: primaryColor,
                        fontWeight: FontWeight.w500),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
