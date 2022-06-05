import 'dart:ui';



class Apis {

  //App production
  static bool appProduction = false;

  //staging server url
  static String stagingBaseUrl = "https://pesaflow.eservices.gov.ss/api";

  //live server url
  static String liveBaseUrl = "https://app.capitalpay.com.ss/api";

  static String baseUrl = "";

  static int connectTimeout = 80*1000;
  static int receiveTimeout = 80*1000;

  static String sentryDns = "";

  // static Dio dio = Dio(
  //   BaseOptions(
  //     baseUrl: Apis.baseUrl,
  //     connectTimeout: Apis.connectTimeout,
  //     receiveTimeout: Apis.receiveTimeout,
  //   ),
  // )..interceptors.add(Logs());

}
