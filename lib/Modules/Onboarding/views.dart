part of 'package:next_millionnaire/imports.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _OnBoardingView();
  }
}

class _OnBoardingView extends State<OnBoardingView> {
  OnBoardingController walkThroughController = OnBoardingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var data = walkThroughController.walkThroughData(context);
    walkThroughController.statusBar(context);

    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: walkThroughController.selectedIndex == 3
          ? primaryColor
          : borderCardBackColor,
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 6,
                child: PageView.builder(
                  controller: walkThroughController._pageController,
                  onPageChanged: (index) {
                    setState(() {
                      walkThroughController.selectedIndex = index;
                    });
                  },
                  itemCount: data.length,
                  itemBuilder: (context, index) => OnBoardingContent(
                    title: data[index]['title'],
                    subtitle: data[index]['subtitle'],
                    image: data[index]["image"],
                    color: data[index]['color'],
                    size1: data[index]['size1'],
                    size2: data[index]['size2'],
                    size3: data[index]['size3'],
                    sizeIcon1: data[index]['sizeIcon1'],
                    sizeIcon2: data[index]['sizeIcon2'],
                    sizeIcon3: data[index]['sizeIcon3'],
                    top1: data[index]['top1'],
                    top2: data[index]['top2'],
                    top3: data[index]['top3'],
                    left1: data[index]['left1'],
                    left2: data[index]['left2'],
                    left3: data[index]['left3'],
                    iconData1: data[index]['iconData1'],
                    iconDataColor1: data[index]['iconDataColor1'],
                    iconData2: data[index]['iconData2'],
                    iconDataColor2: data[index]['iconDataColor2'],
                    iconData3: data[index]['iconData3'],
                    iconDataColor3: data[index]['iconDataColor3'],
                    walkThroughController: walkThroughController,
                  ),
                ),
              ),
              Expanded(
                flex: 0,
                child: Padding(
                  padding: const EdgeInsets.only(top: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      data.length,
                      (index) => walkThroughController.buildDot(
                          context: context, index: index),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              walkThroughController.selectedIndex != 3
                  ? Expanded(
                      flex: 0,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 16, left: 16),
                        child: InkWell(
                          onTap: () {
                             OnBoardingController()._navigationToSignUp();
                          },
                          child: Container(
                              height: 40,
                              child: Center(
                                child: Text(
                                  "Create account",
                                  style: TextStyle(
                                      fontSize: 14, color: cardLightColor),
                                ),
                              ),
                              decoration: BoxDecoration(
                                  color: primaryColor,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(8)))),
                        ),
                      ))
                  : Container(),
              const SizedBox(height: 16),
              walkThroughController.selectedIndex != 3
                  ? Expanded(
                      flex: 0,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 16, left: 16),
                        child: InkWell(
                          onTap: () {
                            // OnBoardingController()._navigationToSignIn();
                          },
                          child: Container(
                              height: 40,
                              child: Center(
                                child: Text(
                                  "Sign in",
                                  style: TextStyle(
                                      fontSize: 14, color: primaryColor),
                                ),
                              ),
                              decoration: BoxDecoration(
                                  color: cardLightColor,
                                  border: Border.all(
                                      color: primaryColor, width: 1.5),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(8)))),
                        ),
                      ),
                    )
                  : InkWell(
                    onTap:()=> Get.offAll(RegisterView()),
                    child: Container(
                      height: 94,
                      width: 94,
                      decoration: BoxDecoration(color: cardLightColor,shape: BoxShape.circle),
                      child: Center(child: Icon(Icons.arrow_forward,color: primaryColor,)),
                    ),
                  ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}

class OnBoardingContent extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final String? image;
  final Color color;
  final double size1;
  final double size2;
  final double size3;
  final double sizeIcon1;
  final double sizeIcon2;
  final double sizeIcon3;
  final double top1;
  final double top2;
  final double top3;
  final double left1;
  final double left2;
  final double left3;
  final String iconData1;
  final Color iconDataColor1;
  final String iconData2;
  final Color iconDataColor2;
  final String iconData3;
  final Color iconDataColor3;
  final OnBoardingController walkThroughController;

  OnBoardingContent({
    Key? key,
    this.title,
    this.subtitle,
    this.image,
    required this.color,
    required this.size1,
    required this.size2,
    required this.size3,
    required this.sizeIcon1,
    required this.sizeIcon2,
    required this.sizeIcon3,
    required this.top1,
    required this.top2,
    required this.top3,
    required this.left1,
    required this.left2,
    required this.left3,
    required this.iconData1,
    required this.iconDataColor1,
    required this.iconData2,
    required this.iconDataColor2,
    required this.iconData3,
    required this.iconDataColor3,
    required this.walkThroughController,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      child: Column(
        children: [
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: SizedBox(
                height: 300,
                width: 300,
                child: Image.asset(
                  image!,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: space30),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Text(
                    title!,
                    style: theme.textTheme.headline5!.copyWith(
                      fontWeight: FontWeight.w700,
                      color: walkThroughController.selectedIndex != 3
                          ? cardDarkColor
                          : cardLightColor,
                    ),
                  ),
                ),
                const SizedBox(height: space10),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Text(
                    subtitle!,
                    style: theme.textTheme.subtitle2!.copyWith(
                        color: walkThroughController.selectedIndex != 3
                            ? cardDarkColor
                            : cardLightColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 18),
                  ),
                ),
                const SizedBox(height: space2),
              ],
            ),
          )
        ],
      ),
    );
  }
}
