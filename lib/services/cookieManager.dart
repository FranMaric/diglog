// ignore: avoid_web_libraries_in_flutter
import 'dart:html' show document;

class CookieManager {
  static addToCookie(String key, String value) {
    document.cookie = "$key=$value; max-age=9999999999; path=/;";
  }

  static String getCookie(String key) {
    String cookies = document.cookie;
    List<String> listValues = cookies.isNotEmpty ? cookies.split(";") : [];
    String matchVal = "";
    for (int i = 0; i < listValues.length; i++) {
      List<String> map = listValues[i].split("=");
      String _key = map[0].trim();
      String _val = map[1].trim();
      if (key == _key) {
        matchVal = _val;
        break;
      }
    }
    return matchVal;
  }
}
