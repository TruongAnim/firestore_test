class Utils {
  static String ellipsisText(String raw, int len) {
    int mid = (len / 2).round() - 1;
    return "${raw.substring(0, mid)}...${raw.substring(raw.length - mid)}";
  }
}
