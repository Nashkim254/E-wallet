part of 'package:next_millionnaire/imports.dart';

class NavigationController extends GetxController{
  BuildContext? controllerContext;

  var isSelected = 0;

  Widget tab() {
    //provisions to check role and pick correct tabs
    return tabClient[isSelected];
  }
updateSelected(index){
    print(index);
    isSelected = index;
    update();
    // return tabClient[index];
  }
  //
    var tabClient = [
    HomeView(),
    ReportsView(),
    ProfileView(),
  ];

  var tabAgent = [
  ];
}
