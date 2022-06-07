part of 'package:next_millionnaire/imports.dart';

class NavigationView extends StatefulWidget {
  const NavigationView({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _NavigationView();
  }
}

class _NavigationView extends State<NavigationView> {
  final navigationController = Get.put(NavigationController());
//   final controller = Get.put(NotificationServiceModel());
//   String notificationTitle = 'No Title';
//   String notificationBody = 'No Body';
//   String notificationData = 'No Data';

//   _changeData(String msg) => setState(() => notificationData = msg);
//   _changeBody(String msg) => setState(() => notificationBody = msg);
//   _changeTitle(String msg) => setState(() => notificationTitle = msg);

//   @override
//   void initState() {
//     final firebaseMessaging = FCM();
//     firebaseMessaging.setNotifications();

//     firebaseMessaging.streamCtlr.stream.listen(_changeData);
//     firebaseMessaging.bodyCtlr.stream.listen(_changeBody);
//     firebaseMessaging.titleCtlr.stream.listen(_changeTitle);
// navigationController.getItem();
// navigationController.getAllData();
//     super.initState();
//   }

// // saveNotification(title, body) async{
// //     printError(title);
// //     printError(body);
// //     FirebaseMessaging.onMessage.listen(
// //           (message) async {

// //         if (message.data.containsKey('data')) {
// //           // Handle data message
// //           printError('Message Notifi 2');
// //           printError(message.data['data']);
// //           // streamCtlr.sink.add(message.data['data']);
// //           AwesomeNotifications().createNotificationFromJsonData(message.data);

// //         }
// //         if (message.data.containsKey('notification')) {
// //           printError("notificationTitle 123");
// //           printError(message.notification!.title!);
// //           printError(message.notification!.body!);
// //           printError(message.messageId);
// //           // Handle notification message
// //           // streamCtlr.sink.add(message.data['notification']);
// //         }
// //         // Or do other work.
// //         // titleCtlr.sink.add(message.notification!.title!);
// //         // bodyCtlr.sink.add(message.notification!.body!);

// //         printError("notificationTitle 123");
// //         printError(message.notification!.title!);
// //         printError(message.notification!.body!);
// //         printError('message.lastMessageId');
// //         printError(navigationController.lastMessageId);
// //         printError('message.messageId');
// //         printError(message.messageId);
// //         navigationController.messageId = message.messageId;
// //         if( navigationController.lastMessageId != navigationController.messageId) {
// //           navigationController.lastMessageId = navigationController.messageId;
// //           await AwesomeNotifications().createNotification(
// //               content: NotificationContent(
// //                   id: 11,
// //                   channelKey: 'basic_channel',
// //                   title: notificationTitle,
// //                   body: notificationBody
// //               )
// //           );
// //           await controller.addItem(NotificationService(
// //             name: title,
// //             description: body,
// //           ));



// //         }
// //       },
// //     );

// // }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        
        // backgroundColor: theme.brightness == Brightness.light
        //     ? backgroundLight
        //     : backgroundDark,
        type: BottomNavigationBarType.fixed,
        enableFeedback: true,
        showUnselectedLabels: true,
        unselectedLabelStyle: TextStyle(color: Color(0xffBEC2C4)),
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.w600,color: primaryColor),
        selectedItemColor:
            theme.brightness == Brightness.light ? accentLight : backgroundDark,
        unselectedItemColor:
            theme.brightness == Brightness.light ? primaryLight : primaryDark,
        currentIndex: navigationController.isSelected,
        elevation: 8.0,
        items: [
          BottomNavigationBarItem(
              activeIcon: SvgPicture.asset(
                "assets/svg/homeSelected.svg",
                height: 22,
                width: 20,
              ),
              icon: SvgPicture.asset(
                "assets/svg/home.svg",
                height: 22,
                width: 20,
              ),
              label: "home",
              //getTranslated(context, "home")
              
              ),
         
          BottomNavigationBarItem(
            activeIcon: SvgPicture.asset(
              "assets/svg/reportsSelected.svg",
              height: 22,
              width: 20,
            ),
            icon: SvgPicture.asset(
              "assets/svg/reports.svg",
              height: 22,
              width: 20,
            ),
            label: "reports",
            //getTranslated(context, "reports")
           
          ),
          BottomNavigationBarItem(
            activeIcon: Image.asset(
              theme.brightness == Brightness.light
                  ? 'assets/images/profile.png'
                  : 'assets/images/profile.png',
              height: 22,
              width: 22,
            ),
            icon: Image.asset(
              theme.brightness == Brightness.light
                  ? 'assets/images/profile.png'
                  : 'assets/images/profile.png',
              height: 22,
              width: 22,
            ),
            label: "profile",
            // getTranslated(context, "profile")
            
          ),
        ],
        onTap: (index) {
          navigationController.updateSelected(index);
          setState(() {
            navigationController.isSelected = index;
          });
        },
      ),
      body: navigationController.tab(),
    );
  }
}
