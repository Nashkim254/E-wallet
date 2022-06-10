part of 'package:next_millionnaire/imports.dart';

class RegisterView extends StatelessWidget {
  RegisterView({Key? key}) : super(key: key);
  final controller = Get.put(RegController());
  final _auth = FirebaseAuth.instance;
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
                "Register",
                style: theme.textTheme.bodyText1!.copyWith(
                    fontSize: 24,
                    color: blackColor,
                    fontWeight: FontWeight.w600),
              ),
            ),
            Form(
                key: controller._formKeyReg,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                        padding: const EdgeInsets.fromLTRB(41, 41, 41, 5),
                        child: TextFormField(
                            controller: controller.nameCont,
                            keyboardType: TextInputType.phone,
                            validator: (value) => controller.validator(value!),
                            style: TextStyle(
                              color: accentColor,
                              fontSize: 15,
                            ),
                            decoration: InputDecoration(
                              hintText: "Full name",
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
                            controller: controller.emailCont,
                            keyboardType: TextInputType.phone,
                            validator: (value) =>
                                controller.emailValidator(value!),
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
                            controller: controller.passCont,
                            keyboardType: TextInputType.phone,
                            validator: (value) =>
                                controller.passValidator(value!),
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
                    Padding(
                        padding: const EdgeInsets.fromLTRB(41, 12, 41, 5),
                        child: TextFormField(
                            controller: controller.confirmCont,
                            keyboardType: TextInputType.phone,
                            validator: (value) {
                              if (controller.passCont.text !=
                                  controller.confirmCont.text) {
                                "Passwords do not match";
                              }
                              return null;
                            },
                            style: TextStyle(
                              color: accentColor,
                              fontSize: 15,
                            ),
                            decoration: InputDecoration(
                              hintText: "Confirm password",
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
                    "Register",
                    style: TextStyle(
                        fontSize: 14,
                        color: cardLightColor,
                        fontWeight: FontWeight.w500),
                  ),
                  onPress: () {
                    if (controller._formKeyReg.currentState!.validate()) {
                      try {
                        final user = _auth.createUserWithEmailAndPassword(
                            email: controller.emailCont.text,
                            password: controller.passCont.text);
                        if (user != null) {
                          Get.to(const NavigationView());
                        }
                      } catch (e) {
                        printError(e);
                      }
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("Please ensure all fields are valid")));
                    }
                  },
                )),
            Padding(
                padding: const EdgeInsets.fromLTRB(41, 74, 0, 5),
                child: Text(
                  "Already have an account?",
                  style: TextStyle(
                      fontSize: 14,
                      color: cardDarkColor,
                      fontWeight: FontWeight.w500),
                )),
            Padding(
                padding: const EdgeInsets.fromLTRB(41, 11, 0, 5),
                child: InkWell(
                  onTap: (() => Get.to(SigninView())),
                  child: Text(
                    "L O G IN   ->",
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
