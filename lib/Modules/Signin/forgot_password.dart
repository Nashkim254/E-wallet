part of 'package:next_millionnaire/imports.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: cardLightColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 58.0, left: 24),
              child: IconButton(
                  onPressed: () => Get.back(),
                  icon: const Icon(Icons.arrow_back)),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 85, left: 41, right: 35),
              child: Text(
                "Forgot Password",
                style: theme.textTheme.subtitle2!.copyWith(
                    color: blackColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 30),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 17, left: 41, right: 35),
              child: Text(
                "Please enter your email address or\nphone number to reset your password",
                style: theme.textTheme.subtitle2!.copyWith(
                    color: blackColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 18),
              ),
            ),
            Padding(
                padding: const EdgeInsets.fromLTRB(41, 70, 41, 5),
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
                padding: const EdgeInsets.fromLTRB(0, 64, 0, 5),
                child: CustomButton(
                  buttoncolor: primaryColor,
                  height: 56,
                  label: Text(
                    "Send",
                    style: TextStyle(
                        fontSize: 14,
                        color: cardLightColor,
                        fontWeight: FontWeight.w500),
                  ),
                  onPress: () {},
                )),
          ],
        ),
      ),
    );
  }
}
