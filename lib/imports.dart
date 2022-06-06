//System Imports
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:next_millionnaire/Utils/Configs/helpers.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_svg/flutter_svg.dart';



//Settings
part 'package:next_millionnaire/Utils/Configs/settings/settings_controller.dart';
part 'package:next_millionnaire/Utils/Configs/settings/settings_service.dart';

//Splash
part 'package:next_millionnaire/Modules/Splash/controller.dart';
part 'package:next_millionnaire/Modules/Splash/view.dart';


//Onboarding
part 'package:next_millionnaire/Modules/Onboarding/controller.dart';
part 'package:next_millionnaire/Modules/Onboarding/views.dart';

//reg
part 'package:next_millionnaire/Modules/Registration/controller.dart';
part 'package:next_millionnaire/Modules/Registration/view.dart';

//signin
part 'package:next_millionnaire/Modules/Signin/controller.dart';
part 'package:next_millionnaire/Modules/Signin/view.dart';