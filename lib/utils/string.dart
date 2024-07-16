extension StringUtils on String {
  String replaceInOrder(Pattern from, List<String> replaceList) {
    var string = this;
    int i = 0;

    while (string.contains(from) && i < replaceList.length) {
      string = string.replaceFirst(from, replaceList[i]);
      i++;
    }

    return string;
  }
}
