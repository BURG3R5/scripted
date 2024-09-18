extension StringUtils on String {
  String replaceInOrder(Set<Pattern> from, List<String> replaceList) {
    var string = this;
    var replacementPlaceholder = '\u{ad920}\u{25a}';

    for (var f in from) {
      string = string.replaceAll(f, replacementPlaceholder);
    }

    int i = 0;
    while (i < replaceList.length) {
      string = string.replaceFirst(replacementPlaceholder, replaceList[i]);
      i++;
    }

    return string;
  }
}
