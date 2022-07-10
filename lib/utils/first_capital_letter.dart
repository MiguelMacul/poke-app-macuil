abstract class FirstCapitalLetter {
  static String firstCapitalLetter(String? str) {
    if (str == null) {
      return "";
    }
    if (str.isEmpty) {
      return "";
    }
    if (str.length == 1) {
      return str.toUpperCase();
    }
    return str.substring(0, 1).toUpperCase() + str.substring(1);
  }
}
