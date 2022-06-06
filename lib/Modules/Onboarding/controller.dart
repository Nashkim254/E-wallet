part of 'package:next_millionnaire/imports.dart';

class OnBoardingController {
  final PageController _pageController = PageController(initialPage: 0);
  int selectedIndex = 0;
  String _userInfoBox = 'userInfo';
  statusBar(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Color(0xff000000).withOpacity(0.2),
      statusBarIconBrightness: Theme.of(context).brightness == Brightness.light
          ? Brightness.dark
          : Brightness.light,
    ));
  }

  walkThroughData(BuildContext context) {
    List<Map<String, dynamic>> data = [
      {
        "title": "Take hold of your finances",
        "subtitle": "Running your finances is easier with next millionnaire",
        "image": "assets/images/Illustration.png",
        "color": primaryColor,
        "size1": 50.0,
        "size2": 100.0,
        "size3": 75.0,
        "sizeIcon1": 2.0,
        "sizeIcon2": 2.0,
        "sizeIcon3": 2.0,
        "top1": 55.0,
        "top2": 250.0,
        "top3": 280.0,
        "left1": 35.0,
        "left2": 8.0,
        "left3": 260.0,
        "iconData1": "assets/images/updown.png",
        "iconDataColor1": iconColor,
        "iconData2": "assets/images/exhange.png",
        "iconDataColor2": accentDark,
        "iconData3": "assets/images/wallet2.png",
        "iconDataColor3": greenColor,
      },
      {
        "title": "See where your money is going",
        "subtitle":"Stay on top by effortlessly tracking your contributions & bills",
        "image": "assets/images/Illustration1.png",
        "color": primaryColor,
        "size1": 50.0,
        "size2": 100.0,
        "size3": 75.0,
        "sizeIcon1": 2.0,
        "sizeIcon2": 2.0,
        "sizeIcon3": 2.0,
        "top1": 30.0,
        "top2": 270.0,
        "top3": 270.0,
        "left1": 269.0,
        "left2": 254.0,
        "left3": 16.0,
        "iconData1": "assets/images/reload.png",
        "iconDataColor1": iconColor,
        "iconData2": "assets/images/money_in.png",
        "iconDataColor2": iconWorldColor,
        "iconData3": "assets/images/world.png",
        "iconDataColor3": primaryColor,
      },
      {
        "title": "Reach your goals with ease",
        "subtitle": "Use the smart saving features to manage your future goals and needs",
        "image": "assets/images/Illustration2.png",
        "color": primaryColor,
        "size1": 50.0,
        "size2": 100.0,
        "size3": 75.0,
        "sizeIcon1": 2.0,
        "sizeIcon2": 2.0,
        "sizeIcon3": 1.0,
        "top1": 60.0,
        "top2": 20.0,
        "top3": 285.0,
        "left1": 37.0,
        "left2": 252.0,
        "left3": 57.0,
        "iconData1": "assets/svg/illustration.svg",
        "iconDataColor1": greenColor,
        "iconData2": "assets/svg/illustration1.svg",
        "iconDataColor2": gradientPinkColor,
        "iconData3": "assets/svg/illustration2.svg",
        "iconDataColor3": gradientPurpleColor,
      },
        {
        "title": "Welcome",
        "subtitle": "Stay on top by effortlessly tracking your contributions & bills",
        "image": "assets/images/welcome.png",
        "color": primaryColor,
        "size1": 50.0,
        "size2": 100.0,
        "size3": 75.0,
        "sizeIcon1": 2.0,
        "sizeIcon2": 2.0,
        "sizeIcon3": 1.0,
        "top1": 60.0,
        "top2": 20.0,
        "top3": 285.0,
        "left1": 37.0,
        "left2": 252.0,
        "left3": 57.0,
        "iconData1": "assets/svg/illustration.svg",
        "iconDataColor1": greenColor,
        "iconData2": "assets/svg/illustration1.svg",
        "iconDataColor2": gradientPinkColor,
        "iconData3": "assets/svg/illustration2.svg",
        "iconDataColor3": gradientPurpleColor,
      },
    ];
    return data;
  }

  AnimatedContainer buildDot({BuildContext? context, int? index}) {
    return AnimatedContainer(
      duration: duration200,
      margin: const EdgeInsets.only(right: space5),
      height: 8,
      width: selectedIndex == index ? 8 : 8,
      decoration: BoxDecoration(
        color: selectedIndex == index
            ? primaryColor
            : primaryColor.withOpacity(0.5),
        borderRadius: BorderRadius.circular(space5),
      ),
    );
  }

  Future? _navigationToSignUp() async{
    // this.addItem(User(visitor: true));
    // var box = await Hive.openBox(_userInfoBox);
    // box.put('visitor', false);
    return Get.to(
      RegisterView(),
      curve: Curves.fastOutSlowIn,
      transition: Transition.native,
      duration: duration200,
    );
  }
  // Future? _navigationToSignIn() async{
  //   return Get.to(
  //     SignInView(),
  //     curve: Curves.fastOutSlowIn,
  //     transition: Transition.native,
  //     duration: duration200,
  //   );
  // }

  selectColorBackground(index){
    if(index == 0){
      return walkthroughColor1;
    } else if(index == 1){
      return walkthroughColor2;
    } else if(index == 2){
      return walkthroughColor3;
    }
  }

  // Animatable<Color> background = TweenSequence<Color>(
  //   [
  //     TweenSequenceItem(
  //       weight: 1.0,
  //       tween: ColorTween(
  //         begin: Colors.red,
  //         end: Colors.green,
  //       ),
  //     ),
  //     TweenSequenceItem(
  //       weight: 1.0,
  //       tween: ColorTween(
  //         begin: Colors.green,
  //         end: Colors.blue,
  //       ),
  //     ),
  //     TweenSequenceItem(
  //       weight: 1.0,
  //       tween: ColorTween(
  //         begin: Colors.blue,
  //         end: Colors.pink,
  //       ),
  //     ),
  //   ],
  // );

}
