part of 'package:next_millionnaire/imports.dart';

class SplashScreenView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SplashScreenView();
  }
}

class _SplashScreenView extends State<SplashScreenView> {
  final controller = Get.put(SplashScreenController());

  @override
  void initState() {
    super.initState();
    controller._loadWidget();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Color(0xff000000).withOpacity(0.2)));
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: primaryColor),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 100,
              width: 100,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: SizedBox(
                  height: 150,
                  width: 150,
                  child: SvgPicture.asset('assets/svg/Logo.svg')),
            ),
            Text(
              "E-Wallet",
              style: theme.textTheme.bodyText1!.copyWith(
                  fontSize: 65,
                  color: cardLightColor,
                  fontWeight: FontWeight.w600),
            ),
            Text(
              "Table Banking, Wallet & Finance",
              style: theme.textTheme.bodyText1!.copyWith(
                  fontSize: 18,
                  color: cardLightColor,
                  fontWeight: FontWeight.w400),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 78.0),
              child: CustomButton(
                buttoncolor: cardLightColor,
                label: Text(
                  "Get Started Now",
                  style: theme.textTheme.bodyText1!.copyWith(
                      fontSize: 18,
                      color: primaryColor,
                      fontWeight: FontWeight.w700),
                ),
                onPress: () {
                  Get.to(NavigationView());
                },
                height: 56,
              ),
            )
          ],
        )),
      ),
    );
  }
}
