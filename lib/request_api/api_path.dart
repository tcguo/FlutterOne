import 'package:hello_flutter/config/appconfig.dart';

class ApiPath {
  static String apiProductUrl = "";
  static String apiDebugUrl = "";
  static String apiGrayUrl = "";
  static String nativeAppBaseRequestUrl = ""; // app传递过来的 地址

  static String get apiRootUrl {
    if (AppConfig.isNotRunInNativeApp) {
      return AppConfig.isDebug ? apiDebugUrl : apiProductUrl;
    }

    return nativeAppBaseRequestUrl.isEmpty
        ? apiProductUrl
        : nativeAppBaseRequestUrl;
  }

  static String city_weather_top15 = "/xxx/xxx";
}
